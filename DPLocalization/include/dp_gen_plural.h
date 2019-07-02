/*
*
*   This is generated source file from 'plural.xml'.
*   http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html
*   http://unicode.org/cldr/trac/browser/trunk/common/supplemental/plurals.xml
*
*
*   n - absolute value of the source number (integer and decimals).
*   i - integer digits of n.
*   v - number of visible fraction digits in n, with trailing zeros.
*   w - number of visible fraction digits in n, without trailing zeros.
*   f - visible fractional digits in n, with trailing zeros.
*   t - visible fractional digits in n, without trailing zeros.
*
*/

enum DPPluralRule {
    DPPluralRuleUnknown,

    DPPluralRuleZero,
    DPPluralRuleOne,
    DPPluralRuleTwo,
    DPPluralRuleFew,
    DPPluralRuleMany,
    DPPluralRuleOther
};

typedef enum DPPluralRule(*dp_plural_rules_func)(double n, int i, int v, int w, int f, int t);

enum DPPluralRule dp_plural_rules_always_other(double n, int i, int v, int w, int f, int t);
dp_plural_rules_func dp_plural_rules_for_lang(const char *lang_code);


enum DPPluralRule dp_plural_rules_af(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ak(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_am(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ar(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_as(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_asa(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ast(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_az(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_azb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_be(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bem(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bez(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bm(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_br(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_brx(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_bs(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ca(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ce(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_cgg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_chr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ckb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_cs(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_cy(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_da(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_de(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_dsb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_dv(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_dz(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ee(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_el(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_en(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_eo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_es(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_et(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_eu(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fa(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ff(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fi(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fil(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fur(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_fy(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ga(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_gd(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_gl(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_gsw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_gu(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_guw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_gv(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ha(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_haw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_he(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_hi(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_hr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_hsb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_hu(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_hy(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_id(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ig(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ii(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_in(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_is(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_it(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_iu(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_iw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ja(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_jbo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_jgo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ji(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_jmc(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_jv(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_jw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ka(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kab(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kaj(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kcg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kde(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kea(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kk(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kkj(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kl(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_km(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ko(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ks(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ksb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ksh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ku(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_kw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ky(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lag(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lkt(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ln(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lt(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_lv(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mas(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mgo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mk(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ml(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ms(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_mt(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_my(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nah(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_naq(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nb(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nd(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ne(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nl(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nnh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_no(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nqo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nso(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ny(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_nyn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_om(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_or(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_os(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_pa(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_pap(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_pl(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_prg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ps(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_pt(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_pt_PT(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_rm(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ro(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_rof(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_root(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ru(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_rwk(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sah(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_saq(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sdh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_se(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_seh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ses(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sg(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_shi(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_si(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sk(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sl(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sma(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_smi(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_smj(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_smn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sms(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_so(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sq(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ss(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ssy(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_st(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sv(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_sw(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_syr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ta(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_te(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_teo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_th(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ti(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_tig(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_tk(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_tl(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_tn(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_to(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_tr(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ts(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_tzm(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ug(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_uk(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ur(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_uz(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_ve(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_vi(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_vo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_vun(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_wa(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_wae(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_wo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_xh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_xog(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_yi(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_yo(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_zh(double n, int i, int v, int w, int f, int t);
enum DPPluralRule dp_plural_rules_zu(double n, int i, int v, int w, int f, int t);
