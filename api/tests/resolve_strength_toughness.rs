mod tests {
    use api::resolve_strength_toughness::resolve_strength_toughness;

    #[test]
    fn it_should_resolve_strength_toughness_similar() {
        let my_s_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let enemy_t_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let expected_results = vec![4, 4, 4, 4, 4, 4, 4, 4, 4, 4];

        for i in 0..my_s_values.len() {
            let my_ws = my_s_values[i];
            let enemy_ws = enemy_t_values[i];
            let expected_result = expected_results[i];
            let result = resolve_strength_toughness(my_ws, enemy_ws);
            assert_eq!(result, expected_result);
        }
    }

    #[test]
    fn it_should_resolve_strength_toughness_high_low() {
        let my_ws_values = vec![10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
        let enemy_ws_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let expected_results = vec![2, 2, 2, 2, 3, 5, 6, 0, 0, 0];

        for i in 0..my_ws_values.len() {
            let my_ws = my_ws_values[i];
            let enemy_ws = enemy_ws_values[i];
            let expected_result = expected_results[i];
            let result = resolve_strength_toughness(my_ws, enemy_ws);
            assert_eq!(result, expected_result);
        }
    }

    #[test]
    fn it_should_resolve_strength_toughness_edges() {
        let my_ws_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let enemy_ws_values = vec![4, 6, 4, 6, 3, 10, 10, 1, 10, 9];
        let expected_results = vec![6, 0, 5, 6, 2, 0, 6, 2, 5, 3];

        for i in 0..my_ws_values.len() {
            let my_ws = my_ws_values[i];
            let enemy_ws = enemy_ws_values[i];
            let expected_result = expected_results[i];
            let result = resolve_strength_toughness(my_ws, enemy_ws);
            assert_eq!(result, expected_result);
        }
    }
}
