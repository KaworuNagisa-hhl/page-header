import { SwiftUIPageHeader } from '@kaworunagisa_hhl/page-header'
import { SwiftUIHeaderStyle } from '@kaworunagisa_hhl/theme'

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
