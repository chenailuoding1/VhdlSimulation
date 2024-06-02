library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AD is
  Port (
    in_GD_Angu_velo_anal: in STD_LOGIC_VECTOR (31 downto 0);
    in_SSD_Sun_visi_sign: in STD_LOGIC_VECTOR (31 downto 0);
    in_SSD_Sun_meas_angl: in STD_LOGIC_VECTOR (31 downto 0);
    in_AD_MR_Curr_mode: in STD_LOGIC_VECTOR (31 downto 0);
    in_ADCC_Tria_atti_angl: in STD_LOGIC_VECTOR (31 downto 0);
    in_ADCC_Tria_angu_velo: in STD_LOGIC_VECTOR (31 downto 0);
    out_AD_MR_Curr_mode_load_inst: out STD_LOGIC;
    out_AD_Angu_velo_anal: out STD_LOGIC_VECTOR (31 downto 0);
    out_AD_Sun_visi_sign: out STD_LOGIC_VECTOR (31 downto 0);
    out_AD_Sun_meas_angl: out STD_LOGIC_VECTOR (31 downto 0);
    out_AD_ADR_Curr_mode: out STD_LOGIC_VECTOR (31 downto 0);
    out_ADR_Tria_atti_angl: out STD_LOGIC_VECTOR (31 downto 0);
    out_ADR_Tria_angu_velo: out STD_LOGIC_VECTOR (31 downto 0);
    out_calc_inst: out STD_LOGIC;
    clk: in STD_LOGIC;
    start: in STD_LOGIC;
    done: out STD_LOGIC;
    rst: in STD_LOGIC
  );
end AD;

architecture Behavioral of AD is
  shared variable Count: integer := 0;
  type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
  signal RAM_AD_Angu_velo_anal: ram_type0;
  signal Angu_velo_anal_addr: integer := 1;
  type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
  signal RAM_AD_Sun_visi_sign: ram_type1;
  signal Sun_visi_sign_addr: integer := 1;
  type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
  signal RAM_AD_Sun_meas_angl: ram_type2;
  signal Sun_meas_angl_addr: integer := 1;
  type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
  signal RAM_AD_Curr_mode: ram_type3;
  signal Curr_mode_addr: integer := 1;
  type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
  signal RAM_AD_Tria_atti_angl: ram_type4;
  signal Tria_atti_angl_addr: integer := 1;
  type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
  signal RAM_AD_Tria_angu_velo: ram_type5;
  signal Tria_angu_velo_addr: integer := 1;
  type states is (sta0, sta1, sta2, sta3, sta4);
  signal sta: states;
begin
  process (start)
  begin
    if start = '1' then
      Count := 1;
    else
      Count := 0;
    end if;
  end process;

  process (clk, rst)
  begin
    if rst = '1' then
      sta <= sta0;
    elsif clk'event and clk = '1' then
      case sta is
        when sta0 =>
          if Count = 1 then
            sta <= sta1;
          else
            sta <= sta0;
          end if;
        when sta1 =>
          sta <= sta2;
        when sta2 =>
          sta <= sta3;
        when sta3 =>
          sta <= sta4;
        when sta4 =>
          sta <= sta0;
      end case;
    end if;
  end process;

  process (sta)
  begin
    case sta is
      when sta0 =>
        done <= '0';
      when sta1 =>
        out_AD_MR_Curr_mode_load_inst <= '1';
      when sta2 =>
        out_AD_Angu_velo_anal <= RAM_AD_Angu_velo_anal(Angu_velo_anal_addr);
        out_calc_inst <= '1';
        out_AD_Sun_visi_sign <= RAM_AD_Sun_visi_sign(Sun_visi_sign_addr);
        out_AD_Sun_meas_angl <= RAM_AD_Sun_meas_angl(Sun_meas_angl_addr);
        out_ADR_Curr_mode <= RAM_AD_Curr_mode(Curr_mode_addr);
        out_AD_MR_Curr_mode_load_inst <= '0';
      when sta3 =>
        out_ADR_Tria_atti_angl <= RAM_AD_Tria_atti_angl(Tria_atti_angl_addr);
        out_calc_inst <= '0';
      when sta4 =>
        out_ADR_Tria_angu_velo <= RAM_AD_Tria_angu_velo(Tria_angu_velo_addr);
        Count := 0;
        done <= '1';
    end case;
  end process;

 
