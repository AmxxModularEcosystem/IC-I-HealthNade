
#include <amxmodx>
#include <reapi>
#include <VipModular>

native HealthNade_GiveNade(const UserId);

#pragma semicolon 1
#pragma compress 1

public stock const PluginName[] = "[VipM-I] Health Nade";
public stock const PluginVersion[] = "1.0.0";
public stock const PluginAuthor[] = "ArKaNeMaN";
public stock const PluginURL[] = "t.me/arkaneman";

new const ITEM_TYPE_NAME[] = "HealthNade";

public VipM_IC_OnInitTypes() {
    register_plugin(PluginName, PluginVersion, PluginAuthor);
    
    VipM_IC_RegisterType(ITEM_TYPE_NAME);
    VipM_IC_RegisterTypeEvent(ITEM_TYPE_NAME, ItemType_OnGive, "@OnHealthNadeGive");
}

@OnHealthNadeGive(const UserId) {
    return is_nullent(HealthNade_GiveNade(UserId)) ? VIPM_STOP : VIPM_CONTINUE;
}
