const WorkspaceSwitcherPopup = imports.ui.workspaceSwitcherPopup;
const WorkspaceAnimation = imports.ui.workspaceAnimation;

let oldShow;
let oldAnimateSwitch;

function init() {
    oldShow = WorkspaceSwitcherPopup.WorkspaceSwitcherPopup.prototype._show;
    oldAnimateSwitch = WorkspaceAnimation.WorkspaceAnimationController.prototype.animateSwitch;
}

function enable() {
    WorkspaceSwitcherPopup.WorkspaceSwitcherPopup.prototype._show = function() { return false };
    WorkspaceAnimation.WorkspaceAnimationController.prototype.animateSwitch = function (
      _from,
      _to,
      _direction,
      onComplete
    ) {
      onComplete();
    };
}

function disable() {
    WorkspaceSwitcherPopup.WorkspaceSwitcherPopup.prototype._show = oldShow;
    WorkspaceAnimation.WorkspaceAnimationController.prototype.animateSwitch = this.oldAnimateSwitch;
}

// Backwards compatability with 3.0.2
function main() {
    enable();
}
