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

#include <string.h>
#include "dp_gen_plural.h"


enum DPPluralRule dp_plural_rules_always_other(double n, int i, int v, int w, int f, int t) {
    return DPPluralRuleOther;
}

dp_plural_rules_func dp_plural_rules_for_lang(const char *lang_code) {
	if (strncmp(lang_code, "af", 2) == 0) return dp_plural_rules_af;
	if (strncmp(lang_code, "ak", 2) == 0) return dp_plural_rules_ak;
	if (strncmp(lang_code, "am", 2) == 0) return dp_plural_rules_am;
	if (strncmp(lang_code, "ar", 2) == 0) return dp_plural_rules_ar;
	if (strncmp(lang_code, "as", 2) == 0) return dp_plural_rules_as;
	if (strncmp(lang_code, "asa", 3) == 0) return dp_plural_rules_asa;
	if (strncmp(lang_code, "ast", 3) == 0) return dp_plural_rules_ast;
	if (strncmp(lang_code, "az", 2) == 0) return dp_plural_rules_az;
	if (strncmp(lang_code, "azb", 3) == 0) return dp_plural_rules_azb;
	if (strncmp(lang_code, "be", 2) == 0) return dp_plural_rules_be;
	if (strncmp(lang_code, "bem", 3) == 0) return dp_plural_rules_bem;
	if (strncmp(lang_code, "bez", 3) == 0) return dp_plural_rules_bez;
	if (strncmp(lang_code, "bg", 2) == 0) return dp_plural_rules_bg;
	if (strncmp(lang_code, "bh", 2) == 0) return dp_plural_rules_bh;
	if (strncmp(lang_code, "bm", 2) == 0) return dp_plural_rules_bm;
	if (strncmp(lang_code, "bn", 2) == 0) return dp_plural_rules_bn;
	if (strncmp(lang_code, "bo", 2) == 0) return dp_plural_rules_bo;
	if (strncmp(lang_code, "br", 2) == 0) return dp_plural_rules_br;
	if (strncmp(lang_code, "brx", 3) == 0) return dp_plural_rules_brx;
	if (strncmp(lang_code, "bs", 2) == 0) return dp_plural_rules_bs;
	if (strncmp(lang_code, "ca", 2) == 0) return dp_plural_rules_ca;
	if (strncmp(lang_code, "ce", 2) == 0) return dp_plural_rules_ce;
	if (strncmp(lang_code, "cgg", 3) == 0) return dp_plural_rules_cgg;
	if (strncmp(lang_code, "chr", 3) == 0) return dp_plural_rules_chr;
	if (strncmp(lang_code, "ckb", 3) == 0) return dp_plural_rules_ckb;
	if (strncmp(lang_code, "cs", 2) == 0) return dp_plural_rules_cs;
	if (strncmp(lang_code, "cy", 2) == 0) return dp_plural_rules_cy;
	if (strncmp(lang_code, "da", 2) == 0) return dp_plural_rules_da;
	if (strncmp(lang_code, "de", 2) == 0) return dp_plural_rules_de;
	if (strncmp(lang_code, "dsb", 3) == 0) return dp_plural_rules_dsb;
	if (strncmp(lang_code, "dv", 2) == 0) return dp_plural_rules_dv;
	if (strncmp(lang_code, "dz", 2) == 0) return dp_plural_rules_dz;
	if (strncmp(lang_code, "ee", 2) == 0) return dp_plural_rules_ee;
	if (strncmp(lang_code, "el", 2) == 0) return dp_plural_rules_el;
	if (strncmp(lang_code, "en", 2) == 0) return dp_plural_rules_en;
	if (strncmp(lang_code, "eo", 2) == 0) return dp_plural_rules_eo;
	if (strncmp(lang_code, "es", 2) == 0) return dp_plural_rules_es;
	if (strncmp(lang_code, "et", 2) == 0) return dp_plural_rules_et;
	if (strncmp(lang_code, "eu", 2) == 0) return dp_plural_rules_eu;
	if (strncmp(lang_code, "fa", 2) == 0) return dp_plural_rules_fa;
	if (strncmp(lang_code, "ff", 2) == 0) return dp_plural_rules_ff;
	if (strncmp(lang_code, "fi", 2) == 0) return dp_plural_rules_fi;
	if (strncmp(lang_code, "fil", 3) == 0) return dp_plural_rules_fil;
	if (strncmp(lang_code, "fo", 2) == 0) return dp_plural_rules_fo;
	if (strncmp(lang_code, "fr", 2) == 0) return dp_plural_rules_fr;
	if (strncmp(lang_code, "fur", 3) == 0) return dp_plural_rules_fur;
	if (strncmp(lang_code, "fy", 2) == 0) return dp_plural_rules_fy;
	if (strncmp(lang_code, "ga", 2) == 0) return dp_plural_rules_ga;
	if (strncmp(lang_code, "gd", 2) == 0) return dp_plural_rules_gd;
	if (strncmp(lang_code, "gl", 2) == 0) return dp_plural_rules_gl;
	if (strncmp(lang_code, "gsw", 3) == 0) return dp_plural_rules_gsw;
	if (strncmp(lang_code, "gu", 2) == 0) return dp_plural_rules_gu;
	if (strncmp(lang_code, "guw", 3) == 0) return dp_plural_rules_guw;
	if (strncmp(lang_code, "gv", 2) == 0) return dp_plural_rules_gv;
	if (strncmp(lang_code, "ha", 2) == 0) return dp_plural_rules_ha;
	if (strncmp(lang_code, "haw", 3) == 0) return dp_plural_rules_haw;
	if (strncmp(lang_code, "he", 2) == 0) return dp_plural_rules_he;
	if (strncmp(lang_code, "hi", 2) == 0) return dp_plural_rules_hi;
	if (strncmp(lang_code, "hr", 2) == 0) return dp_plural_rules_hr;
	if (strncmp(lang_code, "hsb", 3) == 0) return dp_plural_rules_hsb;
	if (strncmp(lang_code, "hu", 2) == 0) return dp_plural_rules_hu;
	if (strncmp(lang_code, "hy", 2) == 0) return dp_plural_rules_hy;
	if (strncmp(lang_code, "id", 2) == 0) return dp_plural_rules_id;
	if (strncmp(lang_code, "ig", 2) == 0) return dp_plural_rules_ig;
	if (strncmp(lang_code, "ii", 2) == 0) return dp_plural_rules_ii;
	if (strncmp(lang_code, "in", 2) == 0) return dp_plural_rules_in;
	if (strncmp(lang_code, "is", 2) == 0) return dp_plural_rules_is;
	if (strncmp(lang_code, "it", 2) == 0) return dp_plural_rules_it;
	if (strncmp(lang_code, "iu", 2) == 0) return dp_plural_rules_iu;
	if (strncmp(lang_code, "iw", 2) == 0) return dp_plural_rules_iw;
	if (strncmp(lang_code, "ja", 2) == 0) return dp_plural_rules_ja;
	if (strncmp(lang_code, "jbo", 3) == 0) return dp_plural_rules_jbo;
	if (strncmp(lang_code, "jgo", 3) == 0) return dp_plural_rules_jgo;
	if (strncmp(lang_code, "ji", 2) == 0) return dp_plural_rules_ji;
	if (strncmp(lang_code, "jmc", 3) == 0) return dp_plural_rules_jmc;
	if (strncmp(lang_code, "jv", 2) == 0) return dp_plural_rules_jv;
	if (strncmp(lang_code, "jw", 2) == 0) return dp_plural_rules_jw;
	if (strncmp(lang_code, "ka", 2) == 0) return dp_plural_rules_ka;
	if (strncmp(lang_code, "kab", 3) == 0) return dp_plural_rules_kab;
	if (strncmp(lang_code, "kaj", 3) == 0) return dp_plural_rules_kaj;
	if (strncmp(lang_code, "kcg", 3) == 0) return dp_plural_rules_kcg;
	if (strncmp(lang_code, "kde", 3) == 0) return dp_plural_rules_kde;
	if (strncmp(lang_code, "kea", 3) == 0) return dp_plural_rules_kea;
	if (strncmp(lang_code, "kk", 2) == 0) return dp_plural_rules_kk;
	if (strncmp(lang_code, "kkj", 3) == 0) return dp_plural_rules_kkj;
	if (strncmp(lang_code, "kl", 2) == 0) return dp_plural_rules_kl;
	if (strncmp(lang_code, "km", 2) == 0) return dp_plural_rules_km;
	if (strncmp(lang_code, "kn", 2) == 0) return dp_plural_rules_kn;
	if (strncmp(lang_code, "ko", 2) == 0) return dp_plural_rules_ko;
	if (strncmp(lang_code, "ks", 2) == 0) return dp_plural_rules_ks;
	if (strncmp(lang_code, "ksb", 3) == 0) return dp_plural_rules_ksb;
	if (strncmp(lang_code, "ksh", 3) == 0) return dp_plural_rules_ksh;
	if (strncmp(lang_code, "ku", 2) == 0) return dp_plural_rules_ku;
	if (strncmp(lang_code, "kw", 2) == 0) return dp_plural_rules_kw;
	if (strncmp(lang_code, "ky", 2) == 0) return dp_plural_rules_ky;
	if (strncmp(lang_code, "lag", 3) == 0) return dp_plural_rules_lag;
	if (strncmp(lang_code, "lb", 2) == 0) return dp_plural_rules_lb;
	if (strncmp(lang_code, "lg", 2) == 0) return dp_plural_rules_lg;
	if (strncmp(lang_code, "lkt", 3) == 0) return dp_plural_rules_lkt;
	if (strncmp(lang_code, "ln", 2) == 0) return dp_plural_rules_ln;
	if (strncmp(lang_code, "lo", 2) == 0) return dp_plural_rules_lo;
	if (strncmp(lang_code, "lt", 2) == 0) return dp_plural_rules_lt;
	if (strncmp(lang_code, "lv", 2) == 0) return dp_plural_rules_lv;
	if (strncmp(lang_code, "mas", 3) == 0) return dp_plural_rules_mas;
	if (strncmp(lang_code, "mg", 2) == 0) return dp_plural_rules_mg;
	if (strncmp(lang_code, "mgo", 3) == 0) return dp_plural_rules_mgo;
	if (strncmp(lang_code, "mk", 2) == 0) return dp_plural_rules_mk;
	if (strncmp(lang_code, "ml", 2) == 0) return dp_plural_rules_ml;
	if (strncmp(lang_code, "mn", 2) == 0) return dp_plural_rules_mn;
	if (strncmp(lang_code, "mo", 2) == 0) return dp_plural_rules_mo;
	if (strncmp(lang_code, "mr", 2) == 0) return dp_plural_rules_mr;
	if (strncmp(lang_code, "ms", 2) == 0) return dp_plural_rules_ms;
	if (strncmp(lang_code, "mt", 2) == 0) return dp_plural_rules_mt;
	if (strncmp(lang_code, "my", 2) == 0) return dp_plural_rules_my;
	if (strncmp(lang_code, "nah", 3) == 0) return dp_plural_rules_nah;
	if (strncmp(lang_code, "naq", 3) == 0) return dp_plural_rules_naq;
	if (strncmp(lang_code, "nb", 2) == 0) return dp_plural_rules_nb;
	if (strncmp(lang_code, "nd", 2) == 0) return dp_plural_rules_nd;
	if (strncmp(lang_code, "ne", 2) == 0) return dp_plural_rules_ne;
	if (strncmp(lang_code, "nl", 2) == 0) return dp_plural_rules_nl;
	if (strncmp(lang_code, "nn", 2) == 0) return dp_plural_rules_nn;
	if (strncmp(lang_code, "nnh", 3) == 0) return dp_plural_rules_nnh;
	if (strncmp(lang_code, "no", 2) == 0) return dp_plural_rules_no;
	if (strncmp(lang_code, "nqo", 3) == 0) return dp_plural_rules_nqo;
	if (strncmp(lang_code, "nr", 2) == 0) return dp_plural_rules_nr;
	if (strncmp(lang_code, "nso", 3) == 0) return dp_plural_rules_nso;
	if (strncmp(lang_code, "ny", 2) == 0) return dp_plural_rules_ny;
	if (strncmp(lang_code, "nyn", 3) == 0) return dp_plural_rules_nyn;
	if (strncmp(lang_code, "om", 2) == 0) return dp_plural_rules_om;
	if (strncmp(lang_code, "or", 2) == 0) return dp_plural_rules_or;
	if (strncmp(lang_code, "os", 2) == 0) return dp_plural_rules_os;
	if (strncmp(lang_code, "pa", 2) == 0) return dp_plural_rules_pa;
	if (strncmp(lang_code, "pap", 3) == 0) return dp_plural_rules_pap;
	if (strncmp(lang_code, "pl", 2) == 0) return dp_plural_rules_pl;
	if (strncmp(lang_code, "prg", 3) == 0) return dp_plural_rules_prg;
	if (strncmp(lang_code, "ps", 2) == 0) return dp_plural_rules_ps;
	if (strncmp(lang_code, "pt", 2) == 0) return dp_plural_rules_pt;
	if (strncmp(lang_code, "pt_PT", 5) == 0) return dp_plural_rules_pt_PT;
	if (strncmp(lang_code, "rm", 2) == 0) return dp_plural_rules_rm;
	if (strncmp(lang_code, "ro", 2) == 0) return dp_plural_rules_ro;
	if (strncmp(lang_code, "rof", 3) == 0) return dp_plural_rules_rof;
	if (strncmp(lang_code, "root", 4) == 0) return dp_plural_rules_root;
	if (strncmp(lang_code, "ru", 2) == 0) return dp_plural_rules_ru;
	if (strncmp(lang_code, "rwk", 3) == 0) return dp_plural_rules_rwk;
	if (strncmp(lang_code, "sah", 3) == 0) return dp_plural_rules_sah;
	if (strncmp(lang_code, "saq", 3) == 0) return dp_plural_rules_saq;
	if (strncmp(lang_code, "sdh", 3) == 0) return dp_plural_rules_sdh;
	if (strncmp(lang_code, "se", 2) == 0) return dp_plural_rules_se;
	if (strncmp(lang_code, "seh", 3) == 0) return dp_plural_rules_seh;
	if (strncmp(lang_code, "ses", 3) == 0) return dp_plural_rules_ses;
	if (strncmp(lang_code, "sg", 2) == 0) return dp_plural_rules_sg;
	if (strncmp(lang_code, "sh", 2) == 0) return dp_plural_rules_sh;
	if (strncmp(lang_code, "shi", 3) == 0) return dp_plural_rules_shi;
	if (strncmp(lang_code, "si", 2) == 0) return dp_plural_rules_si;
	if (strncmp(lang_code, "sk", 2) == 0) return dp_plural_rules_sk;
	if (strncmp(lang_code, "sl", 2) == 0) return dp_plural_rules_sl;
	if (strncmp(lang_code, "sma", 3) == 0) return dp_plural_rules_sma;
	if (strncmp(lang_code, "smi", 3) == 0) return dp_plural_rules_smi;
	if (strncmp(lang_code, "smj", 3) == 0) return dp_plural_rules_smj;
	if (strncmp(lang_code, "smn", 3) == 0) return dp_plural_rules_smn;
	if (strncmp(lang_code, "sms", 3) == 0) return dp_plural_rules_sms;
	if (strncmp(lang_code, "sn", 2) == 0) return dp_plural_rules_sn;
	if (strncmp(lang_code, "so", 2) == 0) return dp_plural_rules_so;
	if (strncmp(lang_code, "sq", 2) == 0) return dp_plural_rules_sq;
	if (strncmp(lang_code, "sr", 2) == 0) return dp_plural_rules_sr;
	if (strncmp(lang_code, "ss", 2) == 0) return dp_plural_rules_ss;
	if (strncmp(lang_code, "ssy", 3) == 0) return dp_plural_rules_ssy;
	if (strncmp(lang_code, "st", 2) == 0) return dp_plural_rules_st;
	if (strncmp(lang_code, "sv", 2) == 0) return dp_plural_rules_sv;
	if (strncmp(lang_code, "sw", 2) == 0) return dp_plural_rules_sw;
	if (strncmp(lang_code, "syr", 3) == 0) return dp_plural_rules_syr;
	if (strncmp(lang_code, "ta", 2) == 0) return dp_plural_rules_ta;
	if (strncmp(lang_code, "te", 2) == 0) return dp_plural_rules_te;
	if (strncmp(lang_code, "teo", 3) == 0) return dp_plural_rules_teo;
	if (strncmp(lang_code, "th", 2) == 0) return dp_plural_rules_th;
	if (strncmp(lang_code, "ti", 2) == 0) return dp_plural_rules_ti;
	if (strncmp(lang_code, "tig", 3) == 0) return dp_plural_rules_tig;
	if (strncmp(lang_code, "tk", 2) == 0) return dp_plural_rules_tk;
	if (strncmp(lang_code, "tl", 2) == 0) return dp_plural_rules_tl;
	if (strncmp(lang_code, "tn", 2) == 0) return dp_plural_rules_tn;
	if (strncmp(lang_code, "to", 2) == 0) return dp_plural_rules_to;
	if (strncmp(lang_code, "tr", 2) == 0) return dp_plural_rules_tr;
	if (strncmp(lang_code, "ts", 2) == 0) return dp_plural_rules_ts;
	if (strncmp(lang_code, "tzm", 3) == 0) return dp_plural_rules_tzm;
	if (strncmp(lang_code, "ug", 2) == 0) return dp_plural_rules_ug;
	if (strncmp(lang_code, "uk", 2) == 0) return dp_plural_rules_uk;
	if (strncmp(lang_code, "ur", 2) == 0) return dp_plural_rules_ur;
	if (strncmp(lang_code, "uz", 2) == 0) return dp_plural_rules_uz;
	if (strncmp(lang_code, "ve", 2) == 0) return dp_plural_rules_ve;
	if (strncmp(lang_code, "vi", 2) == 0) return dp_plural_rules_vi;
	if (strncmp(lang_code, "vo", 2) == 0) return dp_plural_rules_vo;
	if (strncmp(lang_code, "vun", 3) == 0) return dp_plural_rules_vun;
	if (strncmp(lang_code, "wa", 2) == 0) return dp_plural_rules_wa;
	if (strncmp(lang_code, "wae", 3) == 0) return dp_plural_rules_wae;
	if (strncmp(lang_code, "wo", 2) == 0) return dp_plural_rules_wo;
	if (strncmp(lang_code, "xh", 2) == 0) return dp_plural_rules_xh;
	if (strncmp(lang_code, "xog", 3) == 0) return dp_plural_rules_xog;
	if (strncmp(lang_code, "yi", 2) == 0) return dp_plural_rules_yi;
	if (strncmp(lang_code, "yo", 2) == 0) return dp_plural_rules_yo;
	if (strncmp(lang_code, "zh", 2) == 0) return dp_plural_rules_zh;
	if (strncmp(lang_code, "zu", 2) == 0) return dp_plural_rules_zu;
	return NULL;
}

enum DPPluralRule dp_plural_rules_af(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ak(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_am(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ar(double n, int i, int v, int w, int f, int t) {
	int n_mod_100 = (int)n % 100;

	if (n == 0) { // n = 0
		return DPPluralRuleZero;
	}
	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	if ((n_mod_100 >= 3 && n_mod_100 <= 10)) { // n % 100 = 3..10
		return DPPluralRuleFew;
	}
	if ((n_mod_100 >= 11 && n_mod_100 <= 99)) { // n % 100 = 11..99
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_as(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_asa(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ast(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_az(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_azb(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_be(double n, int i, int v, int w, int f, int t) {
	int n_mod_10 = (int)n % 10;
	int n_mod_100 = (int)n % 100;

	if (n_mod_10 == 1 && n_mod_100 != 11) { // n % 10 = 1 and n % 100 != 11
		return DPPluralRuleOne;
	}
	if ((n_mod_10 >= 2 && n_mod_10 <= 4) && !(n_mod_100 >= 12 && n_mod_100 <= 14)) { // n % 10 = 2..4 and n % 100 != 12..14
		return DPPluralRuleFew;
	}
	if (n_mod_10 == 0 || (n_mod_10 >= 5 && n_mod_10 <= 9) || (n_mod_100 >= 11 && n_mod_100 <= 14)) { // n % 10 = 0 or n % 10 = 5..9 or n % 100 = 11..14
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bem(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bez(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bg(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bh(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bm(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bn(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bo(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_br(double n, int i, int v, int w, int f, int t) {
	int n_mod_1000000 = (int)n % 1000000;
	int n_mod_10 = (int)n % 10;
	int n_mod_100 = (int)n % 100;

	if (n_mod_10 == 1 && (n_mod_100 != 11 && n_mod_100 != 71 && n_mod_100 != 91)) { // n % 10 = 1 and n % 100 != 11,71,91
		return DPPluralRuleOne;
	}
	if (n_mod_10 == 2 && (n_mod_100 != 12 && n_mod_100 != 72 && n_mod_100 != 92)) { // n % 10 = 2 and n % 100 != 12,72,92
		return DPPluralRuleTwo;
	}
	if (((n_mod_10 >= 3 && n_mod_10 <= 4) || n_mod_10 == 9) && (!(n_mod_100 >= 10 && n_mod_100 <= 19) && !(n_mod_100 >= 70 && n_mod_100 <= 79) && !(n_mod_100 >= 90 && n_mod_100 <= 99))) { // n % 10 = 3..4,9 and n % 100 != 10..19,70..79,90..99
		return DPPluralRuleFew;
	}
	if (n != 0 && n_mod_1000000 == 0) { // n != 0 and n % 1000000 = 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_brx(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_bs(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;
	int f_mod_100 = (int)f % 100;
	int i_mod_100 = (int)i % 100;

	if ((v == 0 && i_mod_10 == 1 && i_mod_100 != 11) || (f_mod_10 == 1 && f_mod_100 != 11)) { // v = 0 and i % 10 = 1 and i % 100 != 11 or f % 10 = 1 and f % 100 != 11
		return DPPluralRuleOne;
	}
	if ((v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) || ((f_mod_10 >= 2 && f_mod_10 <= 4) && !(f_mod_100 >= 12 && f_mod_100 <= 14))) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14 or f % 10 = 2..4 and f % 100 != 12..14
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ca(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ce(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_cgg(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_chr(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ckb(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_cs(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if ((i >= 2 && i <= 4) && v == 0) { // i = 2..4 and v = 0
		return DPPluralRuleFew;
	}
	if (v != 0) { // v != 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_cy(double n, int i, int v, int w, int f, int t) {

	if (n == 0) { // n = 0
		return DPPluralRuleZero;
	}
	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	if (n == 3) { // n = 3
		return DPPluralRuleFew;
	}
	if (n == 6) { // n = 6
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_da(double n, int i, int v, int w, int f, int t) {

	if ((n == 1) || (t != 0 && (i == 0 || i == 1))) { // n = 1 or t != 0 and i = 0,1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_de(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_dsb(double n, int i, int v, int w, int f, int t) {
	int i_mod_100 = (int)i % 100;
	int f_mod_100 = (int)f % 100;

	if ((v == 0 && i_mod_100 == 1) || (f_mod_100 == 1)) { // v = 0 and i % 100 = 1 or f % 100 = 1
		return DPPluralRuleOne;
	}
	if ((v == 0 && i_mod_100 == 2) || (f_mod_100 == 2)) { // v = 0 and i % 100 = 2 or f % 100 = 2
		return DPPluralRuleTwo;
	}
	if ((v == 0 && (i_mod_100 >= 3 && i_mod_100 <= 4)) || ((f_mod_100 >= 3 && f_mod_100 <= 4))) { // v = 0 and i % 100 = 3..4 or f % 100 = 3..4
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_dv(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_dz(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ee(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_el(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_en(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_eo(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_es(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_et(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_eu(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fa(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ff(double n, int i, int v, int w, int f, int t) {

	if ((i == 0 || i == 1)) { // i = 0,1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fi(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fil(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;

	if ((v == 0 && (i == 1 || i == 2 || i == 3)) || (v == 0 && (i_mod_10 != 4 && i_mod_10 != 6 && i_mod_10 != 9)) || (v != 0 && (f_mod_10 != 4 && f_mod_10 != 6 && f_mod_10 != 9))) { // v = 0 and i = 1,2,3 or v = 0 and i % 10 != 4,6,9 or v != 0 and f % 10 != 4,6,9
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fo(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fr(double n, int i, int v, int w, int f, int t) {

	if ((i == 0 || i == 1)) { // i = 0,1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fur(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_fy(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ga(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	if ((n >= 3 && n <= 6)) { // n = 3..6
		return DPPluralRuleFew;
	}
	if ((n >= 7 && n <= 10)) { // n = 7..10
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_gd(double n, int i, int v, int w, int f, int t) {

	if ((n == 1 || n == 11)) { // n = 1,11
		return DPPluralRuleOne;
	}
	if ((n == 2 || n == 12)) { // n = 2,12
		return DPPluralRuleTwo;
	}
	if (((n >= 3 && n <= 10) || (n >= 13 && n <= 19))) { // n = 3..10,13..19
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_gl(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_gsw(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_gu(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_guw(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_gv(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int i_mod_100 = (int)i % 100;

	if (v == 0 && i_mod_10 == 1) { // v = 0 and i % 10 = 1
		return DPPluralRuleOne;
	}
	if (v == 0 && i_mod_10 == 2) { // v = 0 and i % 10 = 2
		return DPPluralRuleTwo;
	}
	if (v == 0 && (i_mod_100 == 0 || i_mod_100 == 20 || i_mod_100 == 40 || i_mod_100 == 60 || i_mod_100 == 80)) { // v = 0 and i % 100 = 0,20,40,60,80
		return DPPluralRuleFew;
	}
	if (v != 0) { // v != 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ha(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_haw(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_he(double n, int i, int v, int w, int f, int t) {
	int n_mod_10 = (int)n % 10;

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if (i == 2 && v == 0) { // i = 2 and v = 0
		return DPPluralRuleTwo;
	}
	if (v == 0 && !(n >= 0 && n <= 10) && n_mod_10 == 0) { // v = 0 and n != 0..10 and n % 10 = 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_hi(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_hr(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;
	int f_mod_100 = (int)f % 100;
	int i_mod_100 = (int)i % 100;

	if ((v == 0 && i_mod_10 == 1 && i_mod_100 != 11) || (f_mod_10 == 1 && f_mod_100 != 11)) { // v = 0 and i % 10 = 1 and i % 100 != 11 or f % 10 = 1 and f % 100 != 11
		return DPPluralRuleOne;
	}
	if ((v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) || ((f_mod_10 >= 2 && f_mod_10 <= 4) && !(f_mod_100 >= 12 && f_mod_100 <= 14))) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14 or f % 10 = 2..4 and f % 100 != 12..14
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_hsb(double n, int i, int v, int w, int f, int t) {
	int i_mod_100 = (int)i % 100;
	int f_mod_100 = (int)f % 100;

	if ((v == 0 && i_mod_100 == 1) || (f_mod_100 == 1)) { // v = 0 and i % 100 = 1 or f % 100 = 1
		return DPPluralRuleOne;
	}
	if ((v == 0 && i_mod_100 == 2) || (f_mod_100 == 2)) { // v = 0 and i % 100 = 2 or f % 100 = 2
		return DPPluralRuleTwo;
	}
	if ((v == 0 && (i_mod_100 >= 3 && i_mod_100 <= 4)) || ((f_mod_100 >= 3 && f_mod_100 <= 4))) { // v = 0 and i % 100 = 3..4 or f % 100 = 3..4
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_hu(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_hy(double n, int i, int v, int w, int f, int t) {

	if ((i == 0 || i == 1)) { // i = 0,1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_id(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ig(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ii(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_in(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_is(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int i_mod_100 = (int)i % 100;

	if ((t == 0 && i_mod_10 == 1 && i_mod_100 != 11) || (t != 0)) { // t = 0 and i % 10 = 1 and i % 100 != 11 or t != 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_it(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_iu(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_iw(double n, int i, int v, int w, int f, int t) {
	int n_mod_10 = (int)n % 10;

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if (i == 2 && v == 0) { // i = 2 and v = 0
		return DPPluralRuleTwo;
	}
	if (v == 0 && !(n >= 0 && n <= 10) && n_mod_10 == 0) { // v = 0 and n != 0..10 and n % 10 = 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ja(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_jbo(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_jgo(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ji(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_jmc(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_jv(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_jw(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ka(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kab(double n, int i, int v, int w, int f, int t) {

	if ((i == 0 || i == 1)) { // i = 0,1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kaj(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kcg(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kde(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kea(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kk(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kkj(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kl(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_km(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kn(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ko(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ks(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ksb(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ksh(double n, int i, int v, int w, int f, int t) {

	if (n == 0) { // n = 0
		return DPPluralRuleZero;
	}
	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ku(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_kw(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ky(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lag(double n, int i, int v, int w, int f, int t) {

	if (n == 0) { // n = 0
		return DPPluralRuleZero;
	}
	if ((i == 0 || i == 1) && n != 0) { // i = 0,1 and n != 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lb(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lg(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lkt(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ln(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lo(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lt(double n, int i, int v, int w, int f, int t) {
	int n_mod_10 = (int)n % 10;
	int n_mod_100 = (int)n % 100;

	if (n_mod_10 == 1 && !(n_mod_100 >= 11 && n_mod_100 <= 19)) { // n % 10 = 1 and n % 100 != 11..19
		return DPPluralRuleOne;
	}
	if ((n_mod_10 >= 2 && n_mod_10 <= 9) && !(n_mod_100 >= 11 && n_mod_100 <= 19)) { // n % 10 = 2..9 and n % 100 != 11..19
		return DPPluralRuleFew;
	}
	if (f != 0) { // f != 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_lv(double n, int i, int v, int w, int f, int t) {
	int f_mod_10 = (int)f % 10;
	int n_mod_100 = (int)n % 100;
	int f_mod_100 = (int)f % 100;
	int n_mod_10 = (int)n % 10;

	if ((n_mod_10 == 0) || ((n_mod_100 >= 11 && n_mod_100 <= 19)) || (v == 2 && (f_mod_100 >= 11 && f_mod_100 <= 19))) { // n % 10 = 0 or n % 100 = 11..19 or v = 2 and f % 100 = 11..19
		return DPPluralRuleZero;
	}
	if ((n_mod_10 == 1 && n_mod_100 != 11) || (v == 2 && f_mod_10 == 1 && f_mod_100 != 11) || (v != 2 && f_mod_10 == 1)) { // n % 10 = 1 and n % 100 != 11 or v = 2 and f % 10 = 1 and f % 100 != 11 or v != 2 and f % 10 = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mas(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mg(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mgo(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mk(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;

	if ((v == 0 && i_mod_10 == 1) || (f_mod_10 == 1)) { // v = 0 and i % 10 = 1 or f % 10 = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ml(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mn(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mo(double n, int i, int v, int w, int f, int t) {
	int n_mod_100 = (int)n % 100;

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if ((v != 0) || (n == 0) || (n != 1 && (n_mod_100 >= 1 && n_mod_100 <= 19))) { // v != 0 or n = 0 or n != 1 and n % 100 = 1..19
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mr(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ms(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_mt(double n, int i, int v, int w, int f, int t) {
	int n_mod_100 = (int)n % 100;

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 0 || (n_mod_100 >= 2 && n_mod_100 <= 10)) { // n = 0 or n % 100 = 2..10
		return DPPluralRuleFew;
	}
	if ((n_mod_100 >= 11 && n_mod_100 <= 19)) { // n % 100 = 11..19
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_my(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nah(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_naq(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nb(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nd(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ne(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nl(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nn(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nnh(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_no(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nqo(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nr(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nso(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ny(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_nyn(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_om(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_or(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_os(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_pa(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_pap(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_pl(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int i_mod_100 = (int)i % 100;

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if (v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14
		return DPPluralRuleFew;
	}
	if ((v == 0 && i != 1 && (i_mod_10 >= 0 && i_mod_10 <= 1)) || (v == 0 && (i_mod_10 >= 5 && i_mod_10 <= 9)) || (v == 0 && (i_mod_100 >= 12 && i_mod_100 <= 14))) { // v = 0 and i != 1 and i % 10 = 0..1 or v = 0 and i % 10 = 5..9 or v = 0 and i % 100 = 12..14
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_prg(double n, int i, int v, int w, int f, int t) {
	int f_mod_10 = (int)f % 10;
	int n_mod_100 = (int)n % 100;
	int f_mod_100 = (int)f % 100;
	int n_mod_10 = (int)n % 10;

	if ((n_mod_10 == 0) || ((n_mod_100 >= 11 && n_mod_100 <= 19)) || (v == 2 && (f_mod_100 >= 11 && f_mod_100 <= 19))) { // n % 10 = 0 or n % 100 = 11..19 or v = 2 and f % 100 = 11..19
		return DPPluralRuleZero;
	}
	if ((n_mod_10 == 1 && n_mod_100 != 11) || (v == 2 && f_mod_10 == 1 && f_mod_100 != 11) || (v != 2 && f_mod_10 == 1)) { // n % 10 = 1 and n % 100 != 11 or v = 2 and f % 10 = 1 and f % 100 != 11 or v != 2 and f % 10 = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ps(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_pt(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 2) && n != 2) { // n = 0..2 and n != 2
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_pt_PT(double n, int i, int v, int w, int f, int t) {

	if (n == 1 && v == 0) { // n = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_rm(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ro(double n, int i, int v, int w, int f, int t) {
	int n_mod_100 = (int)n % 100;

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if ((v != 0) || (n == 0) || (n != 1 && (n_mod_100 >= 1 && n_mod_100 <= 19))) { // v != 0 or n = 0 or n != 1 and n % 100 = 1..19
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_rof(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_root(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ru(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int i_mod_100 = (int)i % 100;

	if (v == 0 && i_mod_10 == 1 && i_mod_100 != 11) { // v = 0 and i % 10 = 1 and i % 100 != 11
		return DPPluralRuleOne;
	}
	if (v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14
		return DPPluralRuleFew;
	}
	if ((v == 0 && i_mod_10 == 0) || (v == 0 && (i_mod_10 >= 5 && i_mod_10 <= 9)) || (v == 0 && (i_mod_100 >= 11 && i_mod_100 <= 14))) { // v = 0 and i % 10 = 0 or v = 0 and i % 10 = 5..9 or v = 0 and i % 100 = 11..14
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_rwk(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sah(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_saq(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sdh(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_se(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_seh(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ses(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sg(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sh(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;
	int f_mod_100 = (int)f % 100;
	int i_mod_100 = (int)i % 100;

	if ((v == 0 && i_mod_10 == 1 && i_mod_100 != 11) || (f_mod_10 == 1 && f_mod_100 != 11)) { // v = 0 and i % 10 = 1 and i % 100 != 11 or f % 10 = 1 and f % 100 != 11
		return DPPluralRuleOne;
	}
	if ((v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) || ((f_mod_10 >= 2 && f_mod_10 <= 4) && !(f_mod_100 >= 12 && f_mod_100 <= 14))) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14 or f % 10 = 2..4 and f % 100 != 12..14
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_shi(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	if ((n >= 2 && n <= 10)) { // n = 2..10
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_si(double n, int i, int v, int w, int f, int t) {

	if (((n == 0 || n == 1)) || (i == 0 && f == 1)) { // n = 0,1 or i = 0 and f = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sk(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	if ((i >= 2 && i <= 4) && v == 0) { // i = 2..4 and v = 0
		return DPPluralRuleFew;
	}
	if (v != 0) { // v != 0
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sl(double n, int i, int v, int w, int f, int t) {
	int i_mod_100 = (int)i % 100;

	if (v == 0 && i_mod_100 == 1) { // v = 0 and i % 100 = 1
		return DPPluralRuleOne;
	}
	if (v == 0 && i_mod_100 == 2) { // v = 0 and i % 100 = 2
		return DPPluralRuleTwo;
	}
	if ((v == 0 && (i_mod_100 >= 3 && i_mod_100 <= 4)) || (v != 0)) { // v = 0 and i % 100 = 3..4 or v != 0
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sma(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_smi(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_smj(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_smn(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sms(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	if (n == 2) { // n = 2
		return DPPluralRuleTwo;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sn(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_so(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sq(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sr(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;
	int f_mod_100 = (int)f % 100;
	int i_mod_100 = (int)i % 100;

	if ((v == 0 && i_mod_10 == 1 && i_mod_100 != 11) || (f_mod_10 == 1 && f_mod_100 != 11)) { // v = 0 and i % 10 = 1 and i % 100 != 11 or f % 10 = 1 and f % 100 != 11
		return DPPluralRuleOne;
	}
	if ((v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) || ((f_mod_10 >= 2 && f_mod_10 <= 4) && !(f_mod_100 >= 12 && f_mod_100 <= 14))) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14 or f % 10 = 2..4 and f % 100 != 12..14
		return DPPluralRuleFew;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ss(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ssy(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_st(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sv(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_sw(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_syr(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ta(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_te(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_teo(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_th(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ti(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_tig(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_tk(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_tl(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int f_mod_10 = (int)f % 10;

	if ((v == 0 && (i == 1 || i == 2 || i == 3)) || (v == 0 && (i_mod_10 != 4 && i_mod_10 != 6 && i_mod_10 != 9)) || (v != 0 && (f_mod_10 != 4 && f_mod_10 != 6 && f_mod_10 != 9))) { // v = 0 and i = 1,2,3 or v = 0 and i % 10 != 4,6,9 or v != 0 and f % 10 != 4,6,9
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_tn(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_to(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_tr(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ts(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_tzm(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1) || (n >= 11 && n <= 99)) { // n = 0..1 or n = 11..99
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ug(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_uk(double n, int i, int v, int w, int f, int t) {
	int i_mod_10 = (int)i % 10;
	int i_mod_100 = (int)i % 100;

	if (v == 0 && i_mod_10 == 1 && i_mod_100 != 11) { // v = 0 and i % 10 = 1 and i % 100 != 11
		return DPPluralRuleOne;
	}
	if (v == 0 && (i_mod_10 >= 2 && i_mod_10 <= 4) && !(i_mod_100 >= 12 && i_mod_100 <= 14)) { // v = 0 and i % 10 = 2..4 and i % 100 != 12..14
		return DPPluralRuleFew;
	}
	if ((v == 0 && i_mod_10 == 0) || (v == 0 && (i_mod_10 >= 5 && i_mod_10 <= 9)) || (v == 0 && (i_mod_100 >= 11 && i_mod_100 <= 14))) { // v = 0 and i % 10 = 0 or v = 0 and i % 10 = 5..9 or v = 0 and i % 100 = 11..14
		return DPPluralRuleMany;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ur(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_uz(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_ve(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_vi(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_vo(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_vun(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_wa(double n, int i, int v, int w, int f, int t) {

	if ((n >= 0 && n <= 1)) { // n = 0..1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_wae(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_wo(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_xh(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_xog(double n, int i, int v, int w, int f, int t) {

	if (n == 1) { // n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_yi(double n, int i, int v, int w, int f, int t) {

	if (i == 1 && v == 0) { // i = 1 and v = 0
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_yo(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_zh(double n, int i, int v, int w, int f, int t) {

	return DPPluralRuleOther;
}

enum DPPluralRule dp_plural_rules_zu(double n, int i, int v, int w, int f, int t) {

	if (i == 0 || n == 1) { // i = 0 or n = 1
		return DPPluralRuleOne;
	}
	return DPPluralRuleOther;
}

