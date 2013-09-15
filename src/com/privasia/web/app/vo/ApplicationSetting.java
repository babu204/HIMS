package com.privasia.web.app.vo;

import com.theone.framework.vo.annotation.ToTrim;
import com.theone.framework.vo.annotation.ToUpperCase;
import org.hibernate.annotations.AccessType;

import javax.persistence.*;

@Entity(name = "application_setting")
@Table(name = "application_setting")
@AccessType(value = "field")
public class ApplicationSetting extends com.theone.framework.vo.core.VoBase {
    private static final long serialVersionUID = -9082356106505693557L;

    @Id
    @GeneratedValue(generator = "idGen")
    @org.hibernate.annotations.GenericGenerator(name = "idGen", strategy = "uuid.hex")
    @Column(name = "SETTING_ID", length = 32)
    private String settingId;

    @ToTrim
    @ToUpperCase
    @Column(name = "SETTING_NAME", length = 100)
    private String settingName;

    @ToTrim
    @Column(name = "SETTING_VALUE", length = 4000)
    private String settingValue;

    @ToTrim
    @Column(name = "SETTING_DESCRIPTION", length = 4000)
    private String settingDescription;

    public ApplicationSetting() {
    }

    public ApplicationSetting(boolean defaultValue) {
        if (defaultValue) {
        }
    }

    public static enum EnumSettingName {
        ESCALATION_START_WORKING_HOUR("ESCALATION_START_WORKING_HOUR"), ESCALATION_END_WORKING_HOUR("ESCALATION_END_WORKING_HOUR")
            , ESCALATION_CUT_OFF_TIME("ESCALATION_CUT_OFF_TIME"), ESCALATION_ADD_1_DAY("ESCALATION_ADD_1_DAY");
        private String label;

        private EnumSettingName(String label) {
            this.label = label;
        }

        @Override
        public String toString() {
            return label;
        }
    }

    public String getSettingId() {
        return settingId;
    }

    public void setSettingId(String settingId) {
        this.settingId = settingId;
    }

    public String getSettingName() {
        return settingName;
    }

    public void setSettingName(String settingName) {
        this.settingName = settingName;
    }

    public String getSettingValue() {
        return settingValue;
    }

    public void setSettingValue(String settingValue) {
        this.settingValue = settingValue;
    }

    public String getSettingDescription() {
        return settingDescription;
    }

    public void setSettingDescription(String settingDescription) {
        this.settingDescription = settingDescription;
    }
}