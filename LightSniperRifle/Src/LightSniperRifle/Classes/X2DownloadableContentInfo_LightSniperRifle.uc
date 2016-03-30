class X2DownloadableContentInfo_LightSniperRifle extends X2DownloadableContentInfo;

static event OnLoadedSavedGame()
{
	UpdateStorage();
}

static event InstallNewCampaign(XComGameState StartState)
{}

static function UpdateStorage()
{
  local XComGameState NewGameState;
  local XComGameStateHistory History;
  local XComGameState_HeadquartersXCom XComHQ;
  local X2ItemTemplateManager ItemTemplateMgr;
  local X2ItemTemplate ItemTemplate;
  //local X2SchematicTemplate SchematicTemplate_MG, SchematicTemplate_BM;
  local XComGameState_Item NewItemState;

  History = `XCOMHISTORY;
  NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add LightSniperRifles");
  XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
  XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
  NewGameState.AddStateObject(XComHQ);
  ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

  ItemTemplate = ItemTemplateMgr.FindItemTemplate('LightSniperRifle_CV');
  if(ItemTemplate != none)
  {
    if (!XComHQ.HasItem(ItemTemplate))
    {
      NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
      NewGameState.AddStateObject(NewItemState);
      XComHQ.AddItemToHQInventory(NewItemState);
      History.AddGameStateToHistory(NewGameState);
    } else {
      History.CleanupPendingGameState(NewGameState);
    }
  } else {
  }
}
