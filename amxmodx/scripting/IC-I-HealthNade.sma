
#include <amxmodx>
#include <reapi>
#include <VipModular>
#include <healthnade>

#pragma semicolon 1
#pragma compress 1

public stock const PluginName[] = "[IC-I] Health Nade";
public stock const PluginVersion[] = "1.2.0";
public stock const PluginAuthor[] = "ArKaNeMaN";
public stock const PluginURL[] = "t.me/arkaneman";

new const ITEM_TYPE_NAME[] = "HealthNade";

public VipM_IC_OnInitTypes() {
    register_plugin(PluginName, PluginVersion, PluginAuthor);
    
    VipM_IC_RegisterType(ITEM_TYPE_NAME);
    VipM_IC_RegisterTypeEvent(ITEM_TYPE_NAME, ItemType_OnRead, "@OnHealthNadeRead");
    VipM_IC_RegisterTypeEvent(ITEM_TYPE_NAME, ItemType_OnGive, "@OnHealthNadeGive");
}

@OnHealthNadeRead(const JSON:jItem, Trie:tParams) {
    TrieDeleteKey(tParams, "Name");

    if (json_object_has_value(jItem, "ThrowHealingAmount", JSONNumber)) {
        TrieSetCell(tParams, "ThrowHealingAmount", json_object_get_real(jItem, "ThrowHealingAmount"));
    }

    if (json_object_has_value(jItem, "DrinkHealingAmount", JSONNumber)) {
        TrieSetCell(tParams, "DrinkHealingAmount", json_object_get_real(jItem, "DrinkHealingAmount"));
    }

    if (json_object_has_value(jItem, "ExplodeRadius", JSONNumber)) {
        TrieSetCell(tParams, "ExplodeRadius", json_object_get_real(jItem, "ExplodeRadius"));
    }

    if (json_object_has_value(jItem, "Count", JSONNumber)) {
        TrieSetCell(tParams, "Count", json_object_get_number(jItem, "Count"));
    } else {
        TrieSetCell(tParams, "Count", 1);
    }

    if (json_object_has_value(jItem, "MaxCount", JSONNumber)) {
        TrieSetCell(tParams, "MaxCount", json_object_get_number(jItem, "Count"));
    } else {
        TrieSetCell(tParams, "MaxCount", 1);
    }
}

@OnHealthNadeGive(const UserId, const Trie:tParams) {
    new count = 1;
    TrieGetCell(tParams, "Count", count);
    new maxCount = 1;
    TrieGetCell(tParams, "MaxCount", maxCount);

    new iNadeItem = HealthNade_GiveNade(UserId, count, maxCount);
    if (iNadeItem == HN_NULLENT) {
        return VIPM_STOP;
    }

    new Float:fParam = -1.0;

    fParam = VipM_Params_GetFloat(tParams, "ThrowHealingAmount", -1.0);
    if (fParam >= 0.0) {
        set_entvar(iNadeItem, var_HealthNade_ThrowHealingAmount, fParam);
    }

    fParam = VipM_Params_GetFloat(tParams, "DrinkHealingAmount", -1.0);
    if (fParam >= 0.0) {
        set_entvar(iNadeItem, var_HealthNade_DrinkHealingAmount, fParam);
    }

    fParam = VipM_Params_GetFloat(tParams, "ExplodeRadius", -1.0);
    if (fParam >= 0.0) {
        set_entvar(iNadeItem, var_HealthNade_Radius, fParam);
    }

    return VIPM_CONTINUE;
}
