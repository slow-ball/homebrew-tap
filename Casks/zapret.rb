cask "zapret" do
  version "4.0.1"
  sha256 "33d1c66d43d9f1e15dd85278b65cf34a24dbd4c400121f0c932d27b7874f94fd"

  url "https://github.com/slow-ball/zapret-discord-youtube-macos/releases/download/v#{version}/zapret.dmg"
  name "zapret"
  desc "Keeps YouTube, Discord and Telegram working, picking the best strategy itself"
  homepage "https://github.com/slow-ball/zapret-discord-youtube-macos"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "zapret.app"

  uninstall quit: "com.zapret-macos.app"

  zap trash: "~/Library/Containers/com.zapret-macos.app.widget"

  caveats <<~EOS
    Откройте zapret и нажмите «Установить» — понадобится пароль от мака.
    При первом запуске macOS попросит разрешить открытие: Системные настройки →
    Конфиденциальность и безопасность → «Всё равно открыть».

    Удалить сам zapret (службы, правила файрвола, /opt/zapret):
      sudo ~/zapret-macos/src/zapret.sh uninstall
  EOS
end
