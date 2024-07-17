import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:yistore/mixin/toast/toast_mixin.dart';
import 'package:yistore/net/http/app_except.dart';
import 'package:yistore/net/http/result/base_result.dart';
import 'package:yistore/net/http/result/base_wan_result.dart';
import 'package:yistore/until/log_util.dart';
import 'package:yistore/widgets/LoadingDialog.dart';

abstract class BaseController<M> extends SuperController with ToastMixin {
  late M api;
  RxString barTitle = '标题'.obs;
  late EventBus eventBus;
  List<StreamSubscription>? _streamSubList;

  @override
  void onReady() {
    super.onReady();
    logD('>>>>>>>onReady');
    if (useEventBus()) {
      eventBus = Get.find<EventBus>();
    }
    try {
      api = Get.find<M>();
      logD('API initialized successfully');
    } catch (e) {
      logE('Error initializing API: ${e.toString()}');
    }
    // loadNet();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    //解订阅EventBus
    disposeEventBus();
    logD('>>>>>>>onInit');
  }

  @override
  void onInit() {
    super.onInit();
  }



  void loadNet();

  ///解订阅StreamSubscription--关联EventBus
  void disposeEventBus() {
    _streamSubList?.forEach((element) {
      element.cancel();
    });
  }

  @override
  void onDetached() {
    logD('>>>>>>>onDetached');
  }

  @override
  void onInactive() {
    logD('>>>>>>>onInactive');
  }

  @override
  void onPaused() {
    logD('>>>>>>>onPaused');
  }

  @override
  void onResumed() {
    logD('>>>>>>>onResumed');
  }

  /// 发起网络请求，同时处理异常，loading
  httpRequest<T>(
      Future<T> future,
      FutureOr<dynamic> Function(T value) onValue,
      {Function(Exception e)? error,
        bool showLoading = false,
        bool handleError = true,
        bool handleSuccess = true}) {
    if (showLoading) {
      showLoadingDialog();
    }
    future.then((t) {
      ///添加结果码判断（同时考虑加入List的判断逻辑）
      if (t is BaseWanResult) {
        baseWanResultHandler(t, handleSuccess, onValue, handleError);
      } else if (t is BaseResult) {
        baseResultHandler(t, handleSuccess, onValue, handleError);
      } else {
        if (handleSuccess) {
          showSuccess();
        }
        onValue(t);
      }
    }).catchError((e) {
      logE("网络请求异常====>error:$e");
      if (handleError) {
        showError(e: e);
      }
      if (error != null) {
        error(e);
      }
      showToast(e.toString());
    }).whenComplete(() {
      if (showLoading) {
        dismissLoadingDialog();
      }
    });
  }

  ///多网络请求简单封装
  multiHttpRequest(
      List<Future<dynamic>> futures,
      FutureOr<dynamic> Function(dynamic value) onValue,
      {Function(Exception e)? error,
        bool showLoading = false,
        bool handleError = true,
        bool handleSuccess = true}) async {
    if (showLoading) {
      showLoadingDialog();

    }
    Future.wait(futures).then((value) {
      onValue(value);
    }).catchError((e) {
      logE("网络请求异常====>error:$e");
      if (handleError) {
        showError(e: e);
      }
      if (error != null) {
        error(e);
      }
      showToast(e.toString());
    }).whenComplete(() {
      if (showLoading) {
      dismissLoadingDialog();
      }
    });
  }

  ///大阳智投接口处理
  void baseResultHandler<T>(
      t,
      bool handleSuccess,
      FutureOr<dynamic> Function(T value) onValue,
      bool handleError) {
    if ("1" == t.resCode) {
      if (handleSuccess) {
        showSuccess();
      }
      onValue(t);
    } else {
      if (handleError) {
        showToast(t.resMessage);
        showError(errorMessage: t.resMessage);
      } else {
        onValue(t);
        if (handleSuccess) {
          showSuccess();
        }
      }
    }
  }

  /// WanAndroid接口处理
  void baseWanResultHandler<T>(
      t,
      bool handleSuccess,
      FutureOr<dynamic> Function(T value) onValue,
      bool handleError) {
    if (t.errorCode == 0) {
      if (handleSuccess) {
        showSuccess();
      }
      onValue(t);
    } else {
      if (handleError) {
        showToast(t.errorMsg);
        showError(errorMessage: t.errorMsg);
      } else {
        onValue(t);
        if (handleSuccess) {
          showSuccess();
        }
      }
    }
  }

  void showSuccess() {
    change(null, status: RxStatus.success());
  }

  void showEmpty() {
    change(null, status: RxStatus.empty());
  }

  void showError({String? errorMessage, Exception? e}) {
    if (e != null) {
      if (e is AppException) {
        var error = e;
        change(null, status: RxStatus.error(error.message));
      } else {
        change(null, status: RxStatus.error(errorMessage));
      }
    } else {
      change(null, status: RxStatus.error(errorMessage));
    }
  }

  void showLoading() {
    change(null, status: RxStatus.loading());
  }

  ///是否使用GetX查找EventBus
  bool useEventBus() => false;

  ///管理Eventbus解订阅
  void addStreamSub(StreamSubscription? streamSubscription) {
    _streamSubList ??= [];
    if (streamSubscription != null) {
      _streamSubList?.add(streamSubscription);
    }
  }

  void showLoadingDialog() {
    Get.dialog(
        LoadingDialog(),
        barrierDismissible: false // 防止用户通过点击背景来关闭对话框
    );
  }

  void dismissLoadingDialog() {
    Get.back();
  }

}