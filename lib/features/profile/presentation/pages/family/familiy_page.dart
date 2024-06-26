import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/card/rrj_family_item_card.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 36.0, 18.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.icons.iconInformation.svg(
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: Text(
                        LocaleKeys.familyScreen_addFamilyMember.tr(),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Text(LocaleKeys.familyScreen_familyList.tr(),
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 12.0),
                const RRJFamilyItemCard(
                    title: "Ayah", name: "Muhammad Navis Nasrullah"),
                const SizedBox(height: 24.0),
                RRJPrimaryButton(
                  onPressed: () {},
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    LocaleKeys.familyScreen_addMember.tr(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
