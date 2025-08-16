import router from '@ohos.router';

// pages/SettingsPage.ets
@Entry
@Component
struct SettingsPage {
  @State fromPage: string = ''

  onPageShow() {
    const params = router.getParams() as Record<string, string>;
    this.fromPage = params?.['from'] || '';
  }

  build() {
    Column() {
      Text(`来自页面: ${this.fromPage}`)
        .fontColor(Color.Blue)

      // 设置项内容...
    }
  }
}