cask "zapret" do
  version "3.1.0"
  sha256 "c70e00cd43138ace03ac4586f9fc12f6303d4b98d77726885d8463e5edd56cd7"

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
