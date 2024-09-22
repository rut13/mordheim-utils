mod tests {
    use api::resolve_ballistic_skill::resolve_ballistic_skill;

    #[test]
    fn it_should_resolve_ballistic_skill() {
        let ballistic_skill_values = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let expected_results = vec![6, 5, 4, 3, 2, 1, 0, -1, -2, -3];

        for i in 0..ballistic_skill_values.len() {
            let ballistic_skill = ballistic_skill_values[i];
            let expected_result = expected_results[i];
            let result = resolve_ballistic_skill(ballistic_skill);
            assert_eq!(result, expected_result);
        }
    }
}
