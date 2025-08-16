import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import { AbilityConstant, Want } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('[GobangGame] EntryAbility onCreate');
  }

  onDestroy(): void {
    console.log('[GobangGame] EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.log('DEBUG: EntryAbility loaded successfully'); // 确认此日志出现
    // 主页面加载逻辑（保持不变）
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        console.error(`[GobangGame] Failed to load content. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.log(`[GobangGame] Succeeded in loading content. Data: ${JSON.stringify(data)}`);
    });
  }

  onWindowStageDestroy(): void {
    console.log('[GobangGame] EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    console.log('[GobangGame] EntryAbility onForeground');
  }

  onBackground(): void {
    console.log('[GobangGame] EntryAbility onBackground');
  }
}