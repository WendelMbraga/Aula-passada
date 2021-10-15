-- Primeira parte Insert

DELIMITER $$
DROP TRIGGER inserindo_dados $$
CREATE TRIGGER inserindo_dados AFTER INSERT
ON funcionario
FOR EACH ROW
BEGIN
	/*exibindo a data, autor e objetivo igual a apostila de boas práticas*/
	
	  INSERT INTO historico_salario (hisa_func_id, hisa_func_salario) 
        VALUES (NEW.func_id, NEW.func_salario);	
END $$
DELIMITER ;
 /*inserindo os valores para funcionar*/
INSERT INTO funcionario (func_nome, func_salario, func_status, cargo_id)
VALUES ("", 0, "A", 1);

-- segunda parte: Update

DELIMITER $$
DROP TRIGGER upd_registros $$
CREATE TRIGGER upd_registros AFTER UPDATE
ON funcionario
FOR EACH ROW
BEGIN
	/*Indicando a data, autor e objetivo.*/

	UPDATE historico_salario
	 SET hisa_func_salario = NEW.func_salario
	WHERE hisa_func_id = NEW.func_id;
END $$
DELIMITER ;

UPDATE funcionario SET func_salario = 0 WHERE func_id = 0;

-- terceira parte: DELETE
DELIMITER $$
DROP TRIGGER ipd_salario $$
CREATE TRIGGER ipd_salario AFTER DELETE
ON funcionario
FOR EACH ROW
BEGIN
	/*Indicando aqui o salario que a coluna de funcionario irá receber.*/

	UPDATE historico_salario 
	 SET hisa_func_salario = 0
	WHERE hisa_func_id = OLD.func_id;
	
END $$
DELIMITER ;

-- finalizando o script
DELETE FROM funcionario WHERE func_id = 0;
