/* Copyright 2015-2021 Jack Humbert
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include QMK_KEYBOARD_H
#include "muse.h"

enum preonic_layers {
  QWERTY = 0,
  SYM,
  FUN,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[QWERTY] = LAYOUT_preonic_grid(
  KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,     KC_5,     KC_6,           KC_7,       KC_8,     KC_9,    KC_0,    KC_BSPC,
  KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,     KC_T,     KC_Y,           KC_U,       KC_I,     KC_O,    KC_P,    KC_ENT,
  KC_LCTL, KC_A,    KC_S,    KC_D,    KC_F,     KC_G,     KC_H,           KC_J,       KC_K,     KC_L,    KC_SCLN, KC_QUOT,
  KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,     KC_B,     KC_N,           KC_M,       KC_COMM,  KC_DOT,  KC_SLSH, KC_RSFT,
  KC_NO,   KC_NO,   KC_LGUI, KC_LALT, OSL(SYM), KC_SPC,   OSM(MOD_LSFT),  OSL(SYM),   OSL(FUN), KC_NO,   KC_NO,   KC_NO
),
// [_COLEMAK] = LAYOUT_preonic_grid(
//   KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
//   KC_TAB,  KC_Q,    KC_W,    KC_F,    KC_P,    KC_G,    KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, KC_DEL,
//   KC_ESC,  KC_A,    KC_R,    KC_S,    KC_T,    KC_G,    KC_M,    KC_N,    KC_E,    KC_I,    KC_O,    KC_QUOT,
//   KC_LSFT, KC_Z,    KC_X,    KC_D,    KC_V,    KC_B,    KC_K,    KC_H,    KC_COMM, KC_DOT,  KC_SLSH, KC_ENT,
//   BACKLIT, KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
// ),
[SYM] = LAYOUT_preonic_grid(
  _______, _______, _______, _______, _______,  _______, _______,        _______, _______, _______, _______, _______,
  _______, _______, KC_DQUO, KC_PPLS, KC_MINS,  KC_GRV,  KC_DEL,         KC_BSPC, KC_EQL,  KC_UNDS, _______, _______,
  _______, KC_LBRC, KC_LCBR, KC_LPRN, KC_GT,    KC_QUOT, KC_LEFT,        KC_DOWN, KC_UP,   KC_RGHT, _______, _______,
  _______, KC_TILD, KC_RBRC, KC_RCBR, KC_RPRN,  KC_LT,   KC_ENT,         KC_HOME, KC_END,  KC_PIPE, KC_BSLS, _______,
  KC_NO,   KC_NO,   KC_NO,   KC_NO,   _______,  KC_NO,   OSM(MOD_LSFT),  KC_SPC,  KC_NO,   KC_NO,   KC_NO,   KC_NO
),
[FUN] = LAYOUT_preonic_grid(
  KC_NO,   KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,   QK_BOOT,
  _______, KC_F1, KC_F2,   KC_F3,   KC_F4,   KC_NO, KC_NO,   KC_MPRV, KC_MNXT, KC_NO, KC_NO,   KC_NO,
  _______, KC_F5, KC_F6,   KC_F7,   KC_F8,   KC_NO, KC_MUTE, KC_VOLD, KC_VOLU, KC_NO, KC_NO,   KC_NO,
  _______, KC_F9, KC_F10,  KC_F11,  KC_F12,  KC_NO, KC_NO,   KC_MSTP, KC_MPLY, KC_NO, KC_PSCR, KC_NO,
  KC_NO,   KC_NO, _______, _______, _______, KC_NO, KC_NO,   KC_NO,   _______, KC_NO, KC_NO,   KC_NO
)
};

