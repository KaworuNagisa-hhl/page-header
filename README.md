# page-header

`page-header` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃页面头图组件，适合首页概览、记录页头部、任务看板头部和用户状态摘要。默认提供 SwiftUI 风格的玻璃底、柔和渐变、强调光感和指标栏，也支持覆盖颜色、宽高、圆角、边框、阴影、字号和内边距。

## 实际运行效果

下面展示 like-ios 页面头图、毛玻璃渐变和底部指标栏：

![page header preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/page-header@main/docs/page-header-preview.gif)

## 安装

```bash
ohpm install page-header
```


## 正常使用样式

```ts
import { SwiftUIPageHeader } from 'page-header'
import { SwiftUIHeaderStyle, SwiftUITone } from 'theme'

@Component
struct CareOverviewHeader {
  build() {
    SwiftUIPageHeader({
      overline: 'Care Today',
      title: '家庭护理总览',
      subtitle: '关注今日任务、记录同步和异常提醒。',
      style: SwiftUIHeaderStyle.Care,
      tone: SwiftUITone.GlassBlack,
      metrics: [
        { title: '任务完成', value: '82%', icon: 'T', color: '#141414' },
        { title: '记录同步', value: '14', icon: 'R', color: '#333333' },
        { title: '提醒', value: '3', icon: 'A', color: '#5C5C5C' }
      ]
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIPageHeader({
  overline: 'Summary',
  title: '运营总览',
  subtitle: '用于业务首页的可配置头图。',
  style: SwiftUIHeaderStyle.Neutral,
  tone: SwiftUITone.GlassBlack,
  componentWidth: '100%',
  componentHeight: 'auto',
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  accentColor: '#141414',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1.2,
  cornerRadius: 8,
  contentPadding: 16,
  shadowColor: '#66000000',
  shadowRadius: 18,
  titleFontSize: 24,
  subtitleFontSize: 14
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from 'theme'

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth('92%')
  .withHeight('auto')
  .withRadius(8)
  .withFillColor('#E6111111')
  .withTintColor('#22FFFFFF')
  .withBorder('#33FFFFFF', 1)
  .withShadow('#33000000', 16)
  .withPadding(12)

SwiftUIPageHeader({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## 示例目录

完整最小示例见 `example/SwiftUIPageHeaderUsage.ets`。该示例演示了 overline、标题、副标题、风格和指标项组合，适合作为页面首屏头图。

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `overline` | `ResourceStr` | `''` | 顶部短标签 |
| `title` | `ResourceStr` | `''` | 主标题 |
| `subtitle` | `ResourceStr` | `''` | 副标题 |
| `style` | `SwiftUIHeaderStyle` | `Neutral` | 头图视觉类型 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `metrics` | `SwiftUIMetricItem[]` | `[]` | 底部指标栏 |
| `componentWidth` | `Length` | `'100%'` | 组件宽度 |
| `componentHeight` | `Length` | `'auto'` | 组件高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `accentColor` | `ResourceColor` | 自动色调 | 强调色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1.25` | 边框宽度 |
| `cornerRadius` | `number` | `16` | 圆角 |
| `contentPadding` | `number` | `12` | 内容内边距 |
| `shadowColor` | `ResourceColor` | 自动阴影 | 阴影颜色 |
| `shadowRadius` | `number` | `24` | 阴影半径 |
| `titleFontSize` | `number` | `22` | 标题字号 |
| `subtitleFontSize` | `number` | `14` | 副标题字号 |
