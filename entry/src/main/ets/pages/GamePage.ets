import { router } from '@kit.ArkUI'

// pages/GamePage.ets
@Entry
@Component
struct GamePage {
  build() {
    Column() {
      Text('五子棋游戏主界面')
        .fontSize(30)
        .margin(20)

      Button('返回首页')
        .onClick(() => {
          router.back() // 返回上一页
        })
    }
    .width('100%')
    .height('100%')
  }
}