/* tslint:disable */
/* eslint-disable */
/**
* @param {number} my_ws
* @param {number} enemy_ws
* @returns {number}
*/
export function resolve_weapon_skill(my_ws: number, enemy_ws: number): number;
/**
* @param {number} bs
* @returns {number}
*/
export function resolve_ballistic_skill(bs: number): number;
/**
* @param {number} strength
* @param {number} toughness
* @returns {number}
*/
export function resolve_strength_toughness(strength: number, toughness: number): number;

export type InitInput = RequestInfo | URL | Response | BufferSource | WebAssembly.Module;

export interface InitOutput {
  readonly memory: WebAssembly.Memory;
  readonly resolve_weapon_skill: (a: number, b: number) => number;
  readonly resolve_ballistic_skill: (a: number) => number;
  readonly resolve_strength_toughness: (a: number, b: number) => number;
}

export type SyncInitInput = BufferSource | WebAssembly.Module;
/**
* Instantiates the given `module`, which can either be bytes or
* a precompiled `WebAssembly.Module`.
*
* @param {{ module: SyncInitInput }} module - Passing `SyncInitInput` directly is deprecated.
*
* @returns {InitOutput}
*/
export function initSync(module: { module: SyncInitInput } | SyncInitInput): InitOutput;

/**
* If `module_or_path` is {RequestInfo} or {URL}, makes a request and
* for everything else, calls `WebAssembly.instantiate` directly.
*
* @param {{ module_or_path: InitInput | Promise<InitInput> }} module_or_path - Passing `InitInput` directly is deprecated.
*
* @returns {Promise<InitOutput>}
*/
export default function __wbg_init (module_or_path?: { module_or_path: InitInput | Promise<InitInput> } | InitInput | Promise<InitInput>): Promise<InitOutput>;
