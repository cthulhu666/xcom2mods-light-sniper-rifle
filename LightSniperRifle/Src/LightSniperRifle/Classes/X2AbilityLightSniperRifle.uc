class X2AbilityLightSniperRifle extends X2Ability
  dependson (XComGameStateContext_Ability) config(LightSniperRifle);

var config int LIGHT_SNIPER_RIFLE_MOBILITY_BONUS;

static function array<X2DataTemplate> CreateTemplates()
{
  local array<X2DataTemplate> Templates;

  Templates.AddItem(AddLightSniperRifleBonusAbility());

  return Templates;
}

// ******************* Stat Bonuses **********************

static function X2AbilityTemplate AddLightSniperRifleBonusAbility()
{
  local X2AbilityTemplate                 Template;
  local X2Effect_PersistentStatChange   PersistentStatChangeEffect;

  `CREATE_X2ABILITY_TEMPLATE(Template, 'LIGHT_SNIPER_RIFLE_StatBonus');
  Template.IconImage = "img:///gfxXComIcons.NanofiberVest"; 

  Template.AbilitySourceName = 'eAbilitySource_Item';
  Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
  Template.Hostility = eHostility_Neutral;
  Template.bDisplayInUITacticalText = false;
 
  Template.AbilityToHitCalc = default.DeadEye;
  Template.AbilityTargetStyle = default.SelfTarget;
  Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
 
  // Bonus to Mobility and DetectionRange stat effects
  PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
  PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
  PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
  PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.LIGHT_SNIPER_RIFLE_MOBILITY_BONUS);
  //PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SMG_CONVENTIONAL_DETECTIONRADIUSMODIFER);
  Template.AddTargetEffect(PersistentStatChangeEffect);

  Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

  return Template;
}
