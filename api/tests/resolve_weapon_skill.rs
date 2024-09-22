mod tests {
    use api::resolve_weapon_skill::resolve_weapon_skill;

    #[test]
    fn it_should_resolve_weapon_skill_similar() {
        let my_ws_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let enemy_ws_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let expected_results = vec![4, 4, 4, 4, 4, 4, 4, 4, 4, 4];

        for i in 0..my_ws_values.len() {
            let my_ws = my_ws_values[i];
            let enemy_ws = enemy_ws_values[i];
            let expected_result = expected_results[i];
            let result = resolve_weapon_skill(my_ws, enemy_ws);
            assert_eq!(result, expected_result);
        }
    }

    #[test]
    fn it_should_resolve_weapon_skill_high_low() {
        let my_ws_values = vec![10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
        let enemy_ws_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let expected_results = vec![3, 3, 3, 3, 3, 4, 4, 5, 5, 5];

        for i in 0..my_ws_values.len() {
            let my_ws = my_ws_values[i];
            let enemy_ws = enemy_ws_values[i];
            let expected_result = expected_results[i];
            let result = resolve_weapon_skill(my_ws, enemy_ws);
            assert_eq!(result, expected_result);
        }
    }

    #[test]
    fn it_should_resolve_weapon_skill_edges() {
        let my_ws_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let enemy_ws_values = vec![3, 4, 7, 5, 10, 10, 10, 10, 10, 9];
        let expected_results = vec![5, 4, 5, 4, 4, 4, 4, 4, 4, 3];

        for i in 0..my_ws_values.len() {
            let my_ws = my_ws_values[i];
            let enemy_ws = enemy_ws_values[i];
            let expected_result = expected_results[i];
            let result = resolve_weapon_skill(my_ws, enemy_ws);
            assert_eq!(result, expected_result);
        }
    }
}
