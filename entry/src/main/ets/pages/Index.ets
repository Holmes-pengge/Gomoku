// @Entry
// @Component
// struct Index {
//   @State message: string = 'Hello World';
//
//   build() {
//     RelativeContainer() {
//       Text(this.message)
//         .id('HelloWorld')
//         .fontSize($r('app.float.page_text_font_size'))
//         .fontWeight(FontWeight.Bold)
//         .alignRules({
//           center: { anchor: '__container__', align: VerticalAlign.Center },
//           middle: { anchor: '__container__', align: HorizontalAlign.Center }
//         })
//         .onClick(() => {
//           this.message = 'Welcome';
//         })
//     }
//     .height('100%')
//     .width('100%')
//   }
// }


import router from '@ohos.router';
// 注意：不要从 '@ohos.router' 导入 RouterOptions
import type { BusinessError } from '@ohos.base'; // BusinessError 通常从 '@ohos.base' 导入
import promptAction from '@ohos.promptAction';

// 定义页面参数类型
interface PageParams {
  from?: string;
  timestamp?: number;
  mode?: 'single' | 'multiplayer';
}

interface GeneratedObjectLiteralInterface_1 {
  url: string;
  params: PageParams;
}

@Entry
@Component
struct Index {
  // 修复：移除泛型 <PageParams> 并调整 options 对象的类型注解
  private navigateTo(url: string, params?: PageParams) {
    // 修复：options 对象直接使用对象字面量类型，不使用 RouterOptions
    const options: GeneratedObjectLiteralInterface_1 = {
      url: url,
      params: params || {}
    };

    // 修复：移除 router.pushUrl<PageParams> 的泛型调用
    router.pushUrl(options).then(() => {
      console.log(`跳转到 ${url} 成功`);
    }).catch((err: BusinessError) => { // 使用 Promise 风格处理异步操作
      if (err) {
        promptAction.showToast({
          message: `跳转失败: ${err.message}`, // 确保 err.message 可访问
          duration: 2000
        });
        return;
      }
    });
    // 或者，如果您更喜欢回调风格 (根据 API 版本可能已废弃或不推荐 [[5]])
    /*
    router.pushUrl(options, (err: BusinessError) => {
      if (err) {
        promptAction.showToast({
          message: `跳转失败: ${err.message}`,
          duration: 2000
        });
        return;
      }
      console.log(`跳转到 ${url} 成功`);
    });
    */
  }

  build() {
    Column() {
      Button('开始游戏')
        .onClick(() => {
          this.navigateTo('pages/GamePage', {
            mode: 'single',
            timestamp: Date.now()
          });
        })

      Button('游戏设置')
        .onClick(() => {
          this.navigateTo('pages/SettingsPage', {
            from: 'index'
          });
        })
    }
    .width('100%')
  }
}