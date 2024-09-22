pub fn resolve_weapon_skill(my_ws: i32, enemy_ws: i32) -> i32 {
    if my_ws > enemy_ws {
        return 3;
    }
    if my_ws * 2 < enemy_ws {
        return 5;
    }
    return 4;
}
