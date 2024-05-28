from difflib import SequenceMatcher

def code_similarity(code1, code2):
    # 计算两段代码的相似度
    matcher = SequenceMatcher(None, code1, code2)
    similarity = matcher.ratio()
    return similarity

# 示例代码
code1 = """
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity GCO is
port(
	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_GI_Gyro power on instruction
	in_GCOC_GCO_Gyro_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCOCC_GCO_Gyro power on pulse
	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC;--out_GCO_GI_Gyro power on instruction load instruction
	out_GCO_GCOC_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GCO_GCOCC_Gyro power on instruction
	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GCO_G_Gyro power on pulse
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end GCO;
architecture Behavioral of GCO is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_GCO_Gyro_powe_on_inst: ram_type0;
signal Gyro_powe_on_inst_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_GCO_Gyro_powe_on_puls: ram_type1;
signal Gyro_powe_on_puls_addr: integer:=1;
Type states is (sta0,sta1,sta2,sta3);
signal sta:states;
begin

    process(start)

    begin

            if start='1' then 

                Count:=1;

            else

                Count:=0;

            end if;

    end process;

    process(clk,rst)

    begin

        if rst = '1' then

            sta <= sta0;

        elsif clk'event and clk = '1' then

            case sta is

                when sta0 =>

                if Count=1 then 

                    sta<=sta1;

                else

                    sta<=sta0;

                end if;

    
				when sta1=> 
					sta<=sta2;
				when sta2=> 
					sta<=sta3;
				when sta3=> 
					sta<=sta0;
            end case;

        end if;

    end process;

				process(sta)
begin
case
sta is
				when sta0=> 
					done<='0';
				when sta1=> 
					out_GCO_GI_Gyro_powe_on_inst_load_inst<='1';
				when sta2=> 
					out_GCO_GCOC_Gyro_powe_on_inst<=RAM_GCO_Gyro_powe_on_inst(Gyro_powe_on_inst_addr);
					out_calc_inst<='1';
					out_GCO_GI_Gyro_powe_on_inst_load_inst<='0';
				when sta3=> 
					out_GCO_G_Gyro_powe_on_puls<=RAM_GCO_Gyro_powe_on_puls(Gyro_powe_on_puls_addr);
					Count:=0;
					done<='1';
					out_calc_inst<='0';
				end case;
	end process;
	process(in_GCO_GI_Gyro_powe_on_inst)
	begin
		RAM_GCO_Gyro_powe_on_inst(Gyro_powe_on_inst_addr)<=in_GCO_GI_Gyro_powe_on_inst;
	end process;
	process(in_GCOC_GCO_Gyro_powe_on_puls)
	begin
		RAM_GCO_Gyro_powe_on_puls(Gyro_powe_on_puls_addr)<=in_GCOC_GCO_Gyro_powe_on_puls;
	end process;

end Behavioral;
"""

code2 = """
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Gyroconoutput is
--  Port ( );
    port(
        clk:in std_logic;
        done:out std_logic;
        start:in std_logic;
        rst:in std_logic;
        gyro_power_on_signal:in std_logic;--�Ӽ�������������ת���õļӵ��ź�
        --gyro_power_off_signal:in std_logic;
        gyro_power_on_ins:in std_logic;--����ָ��洢�д����ļӵ�ָ��
        --gyro_power_off_ins:in std_logic;
        GC_power_on_ins:out std_logic;--�������������ļӵ�ָ��
        --GC_power_off_ins:out std_logic;
        GC_power_on_signal:out std_logic;--��������ݵļӵ��ź�
        --GC_power_off_signal:out std_logic;
        --gyro_power_off_tran:out std_logic;--�ӵ�ָ��ת��ָ���ʼ���ӵ�ָ��ת���ɼӵ��ź�
        gyro_power_on_tran:out std_logic;
        gyro_power_on_load:out std_logic--���͸�����ָ��洢�ļӵ�ָ��ȡ��ָ��
        --gyro_power_off_load:out std_logic
    );
end Gyroconoutput;

architecture Behavioral of Gyroconoutput is
    type ram_type is array (5 downto 0) of std_logic;
    signal RAM_GC: ram_type;
    Type states is (st0,st1,st2,st3);
    signal sta:states;
    shared variable Count: integer:=0;
    signal gyro_power_on_ins_addr:integer:=1;
    signal gyro_power_off_ins_addr: integer:=2;
    signal gyro_power_on_signal_addr: integer:=3;
    signal gyro_power_off_signal_addr: integer:=4;
begin
    process(start)
    begin
            if start='1' then 
                Count:=1;

            end if;
    end process;
    process(gyro_power_on_ins,gyro_power_on_signal)--�����б仯 �����ݴ洢�н��и���
    begin

        RAM_GC(gyro_power_on_ins_addr)<=gyro_power_on_ins;
        --RAM_GC(gyro_power_off_ins_addr)<=gyro_power_off_ins;
        RAM_GC(gyro_power_on_signal_addr)<=gyro_power_on_signal;
        --RAM_GC(gyro_power_off_signal_addr)<=gyro_power_off_signal;
             
    end process;
    process(clk,rst)
    begin
        if rst = '1' then
                sta <= st0;
        elsif clk'event and clk = '1' then
                case sta is
                    when st0 =>
                        if Count=1 then --1.�����ģ��
                            sta<=st1;
                        else 
                            sta<=st0;
                        end if;
                    when st1 =>
                        sta<=st2; --ȡ�ϵ�ָ��
                    when st2 =>
                        sta<=st3;  --ת���ϵ�ָ��Ϊ�ź�
                    when st3 =>
                        sta<=st0;--����ϵ��ź�


                        
                end case;
        end if;
	end process;

    process(sta)--״̬����߼�����
    begin
        case sta is
                   when st0 =>
                         done<='0';
                         gyro_power_on_load<='0';--���͸�����ָ��洢�ļӵ�ָ��ȡ��ָ��
                         --gyro_power_off_load<='0';
                         --gyro_power_off_tran<='0';
                         gyro_power_on_tran<='0';
                  
                   when st1 =>
                         gyro_power_on_load<='1';--���͸�����ָ��洢�ļӵ�ָ��ȡ��ָ��
                         --gyro_power_off_load<='0';
                         --gyro_power_off_tran<='0';
                         gyro_power_on_tran<='0';
                   when st2 =>
                         gyro_power_on_load<='0';
                         --gyro_power_off_load<='0';
                         --gyro_power_off_tran<='0';
                         gyro_power_on_tran<='1';
                         GC_power_on_ins<=RAM_GC(gyro_power_on_ins_addr);
                         
                    when st3=>
                         gyro_power_on_load<='0';
                         --gyro_power_off_load<='0';
                         --gyro_power_off_tran<='0';
                         gyro_power_on_tran<='0';
                         GC_power_on_signal<=RAM_GC(gyro_power_on_signal_addr);
                         Count:=0;--����ģ���������
                         done<='1';
            end case;
    end process;
end Behavioral;
"""

# 计算相似度
similarity = code_similarity(code1, code2)
print("Similarity:", similarity)
