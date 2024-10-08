use wasm_bindgen::prelude::*;
// +-----------------------------+
// | Ballistic Skill Table       |
// +-----------------------------+
// | BS | Roll Required to Hit   |
// +----+------------------------+
// | 1  | 6+                     |
// | 2  | 5+                     |
// | 3  | 4+                     |
// | 4  | 3+                     |
// | 5  | 2+                     |
// | 6+ | 2+                     |
// +-----------------------------+
#[wasm_bindgen]
pub fn resolve_ballistic_skill(bs: i32) -> i32 {
    return 7 - bs;
}
