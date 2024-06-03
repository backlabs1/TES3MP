#ifndef NEWLAUNCHER_MAIN_HPP
#define NEWLAUNCHER_MAIN_HPP


#include "ui_Main.h"
#include "ServerModel.hpp"
#include "MySortFilterProxyModel.hpp"
#include <components/process/processinvoker.hpp>

class QueryHelper;

class MainWindow : public QMainWindow,  private Ui::MainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow() override;
protected:
    void closeEvent(QCloseEvent * event) Q_DECL_OVERRIDE;
    void addServerAndUpdate(const QString &addr);
protected slots:
    void tabSwitched(int index);
    void addServer();
    void addServerByIP();
    void deleteServer();
    void directConnect();
    void play();
    void serverSelected();
    void testConnect();
    void notFullSwitch(bool state);
    void havePlayersSwitch(bool state);
    void noPasswordSwitch(bool state);
    void maxLatencyChanged(int index);
    void gamemodeChanged(const QString &text);
private:
    QueryHelper *queryHelper;
    Process::ProcessInvoker *mGameInvoker;
    ServerModel *browser, *favorites;
    MySortFilterProxyModel *proxyModel;
    void loadFavorites();
};


#endif //NEWLAUNCHER_MAIN_HPP
