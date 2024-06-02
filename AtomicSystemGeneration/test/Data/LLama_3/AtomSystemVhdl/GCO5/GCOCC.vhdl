entity GCOCC is
port(
	in_GCO_GCOC_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_GCOCC_Gyro power on instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_GCOC_GCO_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GCOCC_GCO_Gyro power on pulse
);
end GCOCC;
architecture Behavioral of GCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
	out_GCOC_GCO_Gyro_powe_on_puls<=in_GCO_GCOC_Gyro_powe_on_inst;
--由输入端口in_GCO_GCOC_Gyro_powe_on_inst、得到输出端口out_GCOC_GCO_Gyro_powe_on_puls、
            end if;

	end process;



end Behavioral;
