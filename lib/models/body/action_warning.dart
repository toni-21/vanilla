class ActionWarningModel {
  String? description;
  Function? onCancel;
  Function? onPressed;
  String? acceptText;
  String? cancelText;

  ActionWarningModel(
      {this.description,
      this.onCancel,
      this.onPressed,
      this.acceptText,
      this.cancelText});
}
