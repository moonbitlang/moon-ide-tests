///|
fn render_cram_files(
  result : CollectResult,
  repo_slug : String,
  platform : TestPlatform,
  performance~ : Bool = false,
  test_root~ : String = "../../..",
  repo_commit~ : String = "",
) -> Array[CramFile] {
  let test_root = normalize_separators(test_root)
  if performance {
    render_performance_cram_files(result, repo_slug, test_root, repo_commit~)
  } else {
    render_snapshot_cram_files(result, repo_slug, platform, test_root)
  }
}
