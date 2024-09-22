
// +-------------------+
// |  Wound Chart      |
// +-------------------+
// | S\T | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
// +-----+---+---+---+---+---+---+---+---+---+----+
// |  1  |  4 | 5 | 6 | 6 | - | - | - | - | - | - |
// |  2  |  3 | 4 | 5 | 6 | 6 | - | - | - | - | - |
// |  3  |  2 | 3 | 4 | 5 | 6 | 6 | - | - | - | - |
// |  4  |  2 | 2 | 3 | 4 | 5 | 6 | 6 | - | - | - |
// |  5  |  2 | 2 | 2 | 3 | 4 | 5 | 6 | 6 | - | - |
// |  6  |  2 | 2 | 2 | 2 | 3 | 4 | 5 | 6 | 6 | - |
// |  7  |  2 | 2 | 2 | 2 | 2 | 3 | 4 | 5 | 6 | 6 |
// |  8  |  2 | 2 | 2 | 2 | 2 | 2 | 3 | 4 | 5 | 6 |
// |  9  |  2 | 2 | 2 | 2 | 2 | 2 | 2 | 3 | 4 | 5 |
// | 10  |  2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 3 | 4 |
// +-----+---+---+---+---+---+---+---+---+---+----+
pub fn resolve_strength_toughness(strength: i32, toughness: i32) -> i32 {
    let difference = strength - toughness;
    if difference >= 2 {
        return 2;
    }
    // when the difference is so large, the toughness is so high that the attack never wounds
    if difference < -3 {
        return 0;
    }
    if difference == -3 {
        return 6;
    }

    return 4 - difference;
}
