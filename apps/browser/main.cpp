#include <QApplication>
#include <QStyleFactory>
#include <components/settings/settings.hpp>
#include <components/files/configurationmanager.hpp>
#include <apps/browser/netutils/QueryClient.hpp>
#include "MainWindow.hpp"

std::string loadSettings (Settings::Manager & settings)
{
    Files::ConfigurationManager mCfgMgr;
    // Create the settings manager and load default settings file
    // Dreamweave: Rename tes3mp settings to dreamweave
    const std::string localdefault = (mCfgMgr.getLocalPath() / "dreamweave-client-default.cfg").string();
    const std::string globaldefault = (mCfgMgr.getGlobalPath() / "dreamweave-client-default.cfg").string();

    // prefer local
    if (boost::filesystem::exists(localdefault))
        settings.loadDefault(localdefault, false);
    else if (boost::filesystem::exists(globaldefault))
        settings.loadDefault(globaldefault, false);
    else
        throw std::runtime_error ("No default settings file found! Make sure the file \"dreamweave-client-default.cfg\" was properly installed.");

    // load user settings if they exist
    const std::string settingspath = (mCfgMgr.getUserConfigPath() / "dreamweave-client.cfg").string();
    if (boost::filesystem::exists(settingspath))
        settings.loadUser(settingspath);

    return settingspath;
}

void setDarkModePalette(QApplication& app) {
    app.setStyle(QStyleFactory::create("Fusion"));
    QPalette darkPalette;
    
    darkPalette.setColor(QPalette::Window, QColor(53, 53, 53));
    darkPalette.setColor(QPalette::WindowText, Qt::white);
    darkPalette.setColor(QPalette::Base, QColor(25, 25, 25));
    darkPalette.setColor(QPalette::AlternateBase, QColor(53, 53, 53));
    darkPalette.setColor(QPalette::ToolTipBase, Qt::white);
    darkPalette.setColor(QPalette::ToolTipText, Qt::white);
    darkPalette.setColor(QPalette::Text, Qt::white);
    darkPalette.setColor(QPalette::Button, QColor(53, 53, 53));
    darkPalette.setColor(QPalette::ButtonText, Qt::white);
    darkPalette.setColor(QPalette::BrightText, Qt::red);
    darkPalette.setColor(QPalette::Link, QColor(42, 130, 218));

    app.setPalette(darkPalette);
}

int main(int argc, char *argv[])
{
    Settings::Manager mgr;

    loadSettings(mgr);

    std::string addr = mgr.getString("address", "Master");
    int port = mgr.getInt("port", "Master");
    bool darkMode = mgr.getBool("darkMode", "General");

    QApplication app(argc, argv);
    
    // initialize resources, if needed
    // Q_INIT_RESOURCE(resfile);

    if (darkMode)
        setDarkModePalette(app);

    QueryClient::Get().SetServer(addr, port);
    MainWindow d;

    // Set the default width and height to 760, 760 to mostly hide the empty space with the scrollbar 
    d.resize(760, 760);

    d.show();
    return app.exec();
}