const Main = imports.ui.main;
const PanelBox = Main.layoutManager.panelBox;
const WorkspaceSwitcherPopup = imports.ui.workspaceSwitcherPopup;
const WorkspaceAnimation = imports.ui.workspaceAnimation;

let oldAnimateSwitch;

function init() {}

function enable() {
    oldAnimateSwitch = WorkspaceAnimation.WorkspaceAnimationController.prototype.animateSwitch;
    oldPanelBoxHeight = PanelBox.height;
    WorkspaceAnimation.WorkspaceAnimationController.prototype.animateSwitch = function (
      _from,
      _to,
      _direction,
      onComplete
    ) {
      onComplete();
    };
    PanelBox.ease({ y: PanelBox.y - PanelBox.height, onComplete: () => { PanelBox.hide() } });
    Main.overview.connect('showing', () => { PanelBox.show(); PanelBox.ease({ y: 0 }) })
    Main.overview.connect('hiding', () => {
      PanelBox.ease({ y: PanelBox.y - PanelBox.height, onComplete: () => { PanelBox.hide() } });
    })
}

function disable() {
    WorkspaceAnimation.WorkspaceAnimationController.prototype.animateSwitch = oldAnimateSwitch;
    PanelBox.show();
    PanelBox.ease({ y: 0 });
}

