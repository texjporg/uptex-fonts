vf & tfm font for upTeX/upLaTeX based on "jis font TFM & VF set"
================================================================


The files in this directory are
based on "jis font TFM & VF set"
by ASCII Corporation (currently ASCII MEDIA WORKS Inc.)
and modified for upTeX/upLaTeX.
These are available under the license agreement in "README_ASCII_Corp.txt".

このディレクトリのファイルは、
株式会社アスキー(現 株式会社アスキー・メディアワークス)による
「jisフォントTFM&VFセット」をもとに
upTeX/upLaTeX向けに改変したものです。
"README_ASCII_Corp.txt" の内容にしたがってご利用ください。


Setting in addition to jis.tfm / jis.tfm から追加した設定
------------------------------------------------------------

### upjis, upjpn for Japanese / 日本語

* Type1: U+FF5F U+3018 U+3016 U+301D U+00AB U+2329 U+301A
* Type2: U+FF60 U+3019 U+3017 U+301F U+00BB U+232A U+301B U+301E
* Type3: U+00B7
* Type5: JIS 0x213D -> U+2014 and U+2015

| Unicode | Name in Unicode                           |   | JIS X 0213 | Name in JIS
|:------:|--------------------------------------------|:--:|:-------:|--------------------
| U+FF5F | FULLWIDTH LEFT WHITE PARENTHESIS           | ｟ | 1-02-54 | 始め二重バーレーン
| U+3018 | LEFT WHITE TORTOISE SHELL BRACKET          | 〘 | 1-02-56 | 始め二重亀甲括弧
| U+3016 | LEFT WHITE LENTICULAR BRACKET              | 〖 | 1-02-58 | 始めすみ付き括弧(白)
| U+301D | REVERSED DOUBLE PRIME QUOTATION MARK       | 〝 | 1-13-64 | 始めダブルミニュート
| U+FF60 | FULLWIDTH RIGHT WHITE PARENTHESIS          | ｠ | 1-02-55 | 終わり二重バーレーン
| U+3019 | RIGHT WHITE TORTOISE SHELL BRACKET         | 〙 | 1-02-57 | 終わり二重亀甲括弧
| U+3017 | RIGHT WHITE LENTICULAR BRACKET             | 〗 | 1-02-59 | 終わりすみ付き括弧(白)
| U+301F | LOW DOUBLE PRIME QUOTATION MARK            | 〟 | 1-13-65 | 終わりダブルミニュート
| U+00B7 | MIDDLE DOT                                 | · | 1-09-14 | 中点（ラテン）
| U+00AB | LEFT-POINTING DOUBLE ANGLE QUOTATION MARK  | « | 1-09-08 | 始め二重山括弧引用記号/始めギュメ
| U+00BB | RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK | » | 1-09-18 | 終わり二重山括弧引用記号/終わりギュメ
| U+2329 | LEFT-POINTING ANGLE BRACKET                | 〈  | NA      | NA
| U+232A | RIGHT-POINTING ANGLE BRACKET               | 〉  | NA      | NA
| U+301A | LEFT WHITE SQUARE BRACKET                  | 〚 | NA      | NA
| U+301B | RIGHT WHITE SQUARE BRACKET                 | 〛 | NA      | NA
| U+301E | DOUBLE PRIME QUOTATION MARK                | 〞 | NA      | NA
| U+FF08 | FULLWIDTH LEFT PARENTHESIS                 | （ | NA      | NA
| U+FF09 | FULLWIDTH RIGHT PARENTHESIS                | ） | NA      | NA
| U+FF3B | FULLWIDTH LEFT SQUARE BRACKET              | ［ | NA      | NA
| U+FF3D | FULLWIDTH RIGHT SQUARE BRACKET             | ］ | NA      | NA
| U+FF5B | FULLWIDTH LEFT CURLY BRACKET               | ｛ | NA      | NA
| U+FF5D | FULLWIDTH RIGHT CURLY BRACKET              | ｝ | NA      | NA


#### About EM DASH & HORIZONTAL BAR / ダッシュ(全角)について

* U+2014: EM DASH
* U+2015: HORIZONTAL BAR
* JIS X 0208    01-29 ダッシュ(全角) (0x213D)
* JIS X 0213  1-01-29 ダッシュ(全角)

JIS -> Unicode conversion is ambiguous and depends on tables.

* 0x213D -> U+2014 : JIS, Macintosh, nkf, JavaJRE1.4.0 or later
* 0x213D -> U+2015 : Windows, gd, JavaJRE1.3.1, upTeX


ChangeLog
---------

## uptex-fonts-20180211
* cmap/UTF8-UTF16:
  Updated (Version: 1.004).
* cmap/cid_mapping.md,UniJISup-UTF16-{H,V},UniJIS2004up-UTF16-{H,V}:
  New CMap files and document on the new cid mapping.
* Add U+00B7 to char_type 3.
* source/Makefile,makejvf-upjis.cnf,makejvf-upjpn.cnf:
  Added characters of Supplementary Ideographic Plane to upjis\*.vf
  Added CJK Unified Ideographs Extension F to upjpn\*.vf & upcns\*.vf

## uptex-1.00 [2012/01/15] TTK
* re-package for upTeX/upLaTeX Ver.1.00 distribution.
* makepl.perl, upjisr-h{,-hk}.pl, upjisr-v.pl,
  upjis{r,g}-{h,v}.tfm, up{jpn,kor,sch,tch}{rm,gt}-{h,v}.tfm:
  add U+2014 as Type 5 in tfm files.
* upjpn{rm,gt}-{h,v}.vf:
  add CJK Unified Ideographs Extension C,D.
* Makefile:
  update.

## v20110507a [2011/05/07] TTK
* re-package for upTeX/upLaTeX based on uptex-0.30 distribution.
