import {
  getHeaderAccentColor,
  getHeaderGradientStops,
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  headerUsesLightText,
  SWIFT_UI_INFO,
  SWIFT_UI_RADIUS_CARD,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SHADOW,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_MEDIUM,
  SWIFT_UI_SPACING_SMALL,
  SWIFT_UI_TEXT_PRIMARY,
  SWIFT_UI_TEXT_SECONDARY,
  swiftUIColorWithOpacity,
  SwiftUIHeaderStyle,
  SwiftUIMetricItem,
  SwiftUITone
} from 'theme'
import { SwiftUIMetricRail } from 'metric-rail'

@Component
export struct SwiftUIPageHeader {
  @Prop overline: ResourceStr = ''
  @Prop title: ResourceStr = ''
  @Prop subtitle: ResourceStr = ''
  @Prop style: SwiftUIHeaderStyle = SwiftUIHeaderStyle.Neutral
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop metrics: SwiftUIMetricItem[] = []
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = 'auto'
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop accentColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1.25
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CARD
  @Prop contentPadding: number = SWIFT_UI_SPACING_MEDIUM
  @Prop shadowColor: ResourceColor = '#00000000'
  @Prop shadowRadius: number = 24
  @Prop titleFontSize: number = 22
  @Prop subtitleFontSize: number = 14

  private resolvedAccentColor(): ResourceColor {
    return this.accentColor === '#00000000' ? getHeaderAccentColor(this.style, this.tone) : this.accentColor
  }

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).border : this.customBorderColor
  }

  private resolvedShadowColor(): ResourceColor {
    return this.shadowColor === '#00000000' ? swiftUIColorWithOpacity(this.resolvedAccentColor(), this.style === SwiftUIHeaderStyle.Tasks ? 0.10 : (headerUsesLightText(this.style) ? 0.18 : 0.12)) : this.shadowColor
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Stack({ alignContent: Alignment.TopStart }) {
        Row()
          .width(168)
          .height(280)
          .backgroundColor(headerUsesLightText(this.style) ? '#2EFFFFFF' : '#38FFFFFF')
          .rotate({ angle: 15 })
      }
      .width(0)
      .height(0)
      .translate({ x: 62, y: -54 })

      Stack({ alignContent: Alignment.TopStart }) {
        Row()
          .width(136)
          .height(220)
          .backgroundColor(swiftUIColorWithOpacity(this.resolvedAccentColor(), headerUsesLightText(this.style) ? 0.34 : 0.44))
          .rotate({ angle: -14 })
      }
      .width(0)
      .height(0)
      .translate({ x: 96, y: 36 })

      Stack({ alignContent: Alignment.TopStart }) {
        Row()
          .width(156)
          .height(86)
          .linearGradient({
            direction: GradientDirection.LeftBottom,
            colors: [
              [headerUsesLightText(this.style) ? '#29FFFFFF' : '#47FFFFFF', 0.0],
              [swiftUIColorWithOpacity(this.resolvedAccentColor(), headerUsesLightText(this.style) ? 0.26 : 0.34), 0.58],
              ['#0AFFFFFF', 1.0]
            ]
          })
          .borderRadius(SWIFT_UI_RADIUS_CARD)
      }
      .width(0)
      .height(0)
      .translate({ x: 50, y: -30 })

      Column({ space: SWIFT_UI_SPACING_MEDIUM }) {
        Row({ space: SWIFT_UI_SPACING_MEDIUM }) {
          Column({ space: 3 }) {
            Blank()
              .width(5)
              .layoutWeight(1)
              .backgroundColor(headerUsesLightText(this.style) ? '#DBFFFFFF' : this.resolvedAccentColor())
              .borderRadius(2)

            Blank()
              .width(5)
              .height(18)
              .backgroundColor(headerUsesLightText(this.style) ? this.resolvedAccentColor() : SWIFT_UI_INFO)
              .borderRadius(2)
          }
          .height(58)
          .padding({ top: SWIFT_UI_SPACING_EXTRA_SMALL })

          Column({ space: SWIFT_UI_SPACING_EXTRA_SMALL }) {
            Text(this.overline)
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor(headerUsesLightText(this.style) ? getSwiftUIPalette(this.tone).primaryDark : swiftUIColorWithOpacity(getSwiftUIPalette(this.tone).primaryDark, 0.88))
              .textCase(TextCase.UpperCase)
              .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: SWIFT_UI_SPACING_EXTRA_SMALL, bottom: SWIFT_UI_SPACING_EXTRA_SMALL })
              .backgroundColor(headerUsesLightText(this.style) ? '#D1FFFFFF' : '#7AFFFFFF')
              .borderRadius(SWIFT_UI_RADIUS_CONTROL)
              .maxLines(1)

            Text(this.title)
              .fontSize(this.titleFontSize)
              .fontWeight(FontWeight.Bold)
              .fontColor(headerUsesLightText(this.style) ? Color.White : SWIFT_UI_TEXT_PRIMARY)
              .width('100%')
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(this.subtitle)
              .fontSize(this.subtitleFontSize)
              .fontColor(headerUsesLightText(this.style) ? '#D1FFFFFF' : SWIFT_UI_TEXT_SECONDARY)
              .width('100%')
              .maxLines(3)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .alignItems(VerticalAlign.Top)

        if (this.metrics.length > 0) {
          SwiftUIMetricRail({
            items: this.metrics,
            usesContrastFill: this.style === SwiftUIHeaderStyle.Tasks,
            tone: this.tone,
            fillColor: this.fillColor,
            tintColor: this.resolvedTintColor(),
            customBorderColor: this.resolvedBorderColor(),
            cornerRadius: this.cornerRadius
          })
        }
      }
      .width('100%')
      .padding(this.contentPadding)
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
    .backgroundColor(headerUsesLightText(this.style) ? this.resolvedAccentColor() : this.fillColor)
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: headerUsesLightText(this.style) ? getHeaderGradientStops(this.style, this.tone) : [
        [this.fillColor, 0.0],
        [this.fillColor, 0.62],
        [this.resolvedTintColor(), 1.0]
      ]
    })
    .backgroundBlurStyle(headerUsesLightText(this.style) ? BlurStyle.Thick : BlurStyle.Regular)
    .borderRadius(this.cornerRadius)
    .clip(true)
    .border({ width: this.customBorderWidth, color: headerUsesLightText(this.style) ? '#66FFFFFF' : this.resolvedBorderColor() })
    .shadow({ radius: this.shadowRadius, color: this.resolvedShadowColor(), offsetX: 0, offsetY: 11 })
  }
}
