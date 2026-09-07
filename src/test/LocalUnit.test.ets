import { describe, it, expect } from '@ohos/hypium'
import {
  getHeaderAccentColor,
  getHeaderGradientStops,
  getSwiftUIGlassMaterial,
  headerUsesLightText,
  SwiftUIHeaderStyle,
  SwiftUITone
} from 'theme'

export default function localUnitTest() {
  describe('SwiftUIPageHeader', () => {
    it('keeps_header_style_contracts', 0, () => {
      expect(headerUsesLightText(SwiftUIHeaderStyle.Care)).assertTrue()
      expect(headerUsesLightText(SwiftUIHeaderStyle.Neutral)).assertFalse()
      expect(getHeaderGradientStops(SwiftUIHeaderStyle.Care, SwiftUITone.CareGreen).length).assertEqual(3)
      expect(getHeaderAccentColor(SwiftUIHeaderStyle.Tasks, SwiftUITone.CareGreen).toString()).assertContain('#')
    })

    it('uses_glass_material_for_neutral_header', 0, () => {
      expect(getSwiftUIGlassMaterial(SwiftUITone.CareGreen).fill.toString()).assertContain('#')
    })
  })
}
