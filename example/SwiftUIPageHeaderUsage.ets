import { SwiftUIPageHeader } from 'page-header'
import { SwiftUIHeaderStyle } from 'theme'

@Component
export struct SwiftUIPageHeaderUsage {
  build() {
    SwiftUIPageHeader({
      overline: 'Overview',
      title: 'Care Dashboard',
      subtitle: 'A compact iOS-like page header for HarmonyOS ArkUI.',
      style: SwiftUIHeaderStyle.Care,
      metrics: [
        { title: 'Today', value: '6' },
        { title: 'Done', value: '4' }
      ]
    })
  }
}
