class X2ItemLightSniperRifle extends X2Item config(LightSniperRifle);

var config WeaponDamageValue LIGHTSNIPERRIFLE_CONVENTIONAL_BASEDAMAGE;

var config int LIGHTSNIPERRIFLE_CONVENTIONAL_AIM;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_CRITCHANCE;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_ICLIPSIZE;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_ISUPPLIES;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_TRADINGPOSTVALUE;
var config int LIGHTSNIPERRIFLE_CONVENTIONAL_IPOINTS;

var config array<int> LONG_CONVENTIONAL_RANGE;
var config array<int> LONG_MAGNETIC_RANGE;
var config array<int> LONG_BEAM_RANGE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	
	Weapons.AddItem(CreateTemplate_LightSniperRifle_Conventional());

	return Weapons;
}

static function X2DataTemplate CreateTemplate_LightSniperRifle_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'LightSniperRifle_CV');
	Template.WeaponPanelImage = "_ConventionalSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvSniper.ConvSniper_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = default.LONG_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.LIGHTSNIPERRIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.LIGHTSNIPERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.LIGHTSNIPERRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.LIGHTSNIPERRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.LIGHTSNIPERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.LIGHTSNIPERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 1;
	Template.iTypicalActionCost = 2;

	Template.bIsLargeWeapon = true;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.Abilities.AddItem('LIGHT_SNIPER_RIFLE_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2AbilityLightSniperRifle'.default.LIGHT_SNIPER_RIFLE_MOBILITY_BONUS);
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_SniperRifle_CV.WP_SniperRifle_CV";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_MagA");
	Template.AddDefaultAttachment('Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvSniper.Meshes.SM_ConvSniper_ReargripA" /*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
	Template.AddDefaultAttachment('Stock', "ConvSniper.Meshes.SM_ConvSniper_StockA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_StockA");
	Template.AddDefaultAttachment('Suppressor', "ConvSniper.Meshes.SM_ConvSniper_SuppressorA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_SuppressorA");
	Template.AddDefaultAttachment('Trigger', "ConvSniper.Meshes.SM_ConvSniper_TriggerA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.UpgradeItem = 'SniperRifle_MG';

	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}