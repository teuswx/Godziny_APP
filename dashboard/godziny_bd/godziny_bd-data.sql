select * from tb_usuario;

-- Inserir usuários ADM
INSERT INTO tb_usuario (matricula, created_at, email, senha, nome, tipo) VALUES
(5, '2024-07-10T00:16:18', 'maria.silva@professor.com', 'senha001', 'Maria Silva', 'ADM'),
(6, '2024-07-10T00:16:18', 'joao.santos@professor.com', 'senha002', 'João Santos', 'ADM'),
(7, '2024-07-10T00:16:18', 'lucas.oliveira@professor.com', 'senha003', 'Lucas Oliveira', 'ADM'),
(8, '2024-07-10T00:16:18', 'ana.martins@professor.com', 'senha004', 'Ana Martins', 'ADM'),
(9, '2024-07-10T00:16:18', 'pedro.gomes@professor.com', 'senha005', 'Pedro Gomes', 'ADM'),
(10, '2024-07-10T00:16:18', 'carla.pereira@professor.com', 'senha006', 'Carla Pereira', 'ADM');


-- Inserir cursos
INSERT INTO tb_curso (id, sigla, nome, carga_horaria_complementar, coordenador_id) VALUES
('7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'ENG-COMP', 'Engenharia da Computação', 420, 1),
('3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'ENG-MECA', 'Engenharia Mecatrônica', 420, 6),
('29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'ENG-CIV', 'Engenharia Civil', 420, 6),
('c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'MODA', 'Bacharelado em Moda', 450, 7),
('d2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 'MED', 'Medicina', 600, 7),
('f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'DIR', 'Direito', 500, 7),
('ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'ADM', 'Administração', 450, 7),
('e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'ENG-PROD', 'Engenharia de Produção', 420, 6),
('dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'ENG-AMB', 'Engenharia Ambiental', 420, 6),
('91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'ENG-ELT', 'Engenharia Elétrica', 420, 6);

-- Inserir usuários Não Administradores
INSERT INTO tb_usuario (matricula, created_at, curso_id, email, senha, nome, tipo) VALUES
(11, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'victor.souza@aluno.com', 'senha011', 'Victor Souza', 'NORMAL'),
(12, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'larissa.oliveira@aluno.com', 'senha012', 'Larissa Oliveira', 'NORMAL'),
(13, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'danilo.pereira@aluno.com', 'senha013', 'Danilo Pereira', 'NORMAL'),
(14, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'beatriz.goncalves@aluno.com', 'senha014', 'Beatriz Gonçalves', 'NORMAL'),
(15, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'carlos.martins@aluno.com', 'senha015', 'Carlos Martins', 'NORMAL'),
(16, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'sabrina.farias@aluno.com', 'senha016', 'Sabrina Farias', 'NORMAL'),
(17, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'jose.augusto@aluno.com', 'senha017', 'José Augusto', 'NORMAL'),
(18, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'amanda.santos@aluno.com', 'senha018', 'Amanda Santos', 'NORMAL'),
(19, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'gabriel.melo@aluno.com', 'senha019', 'Gabriel Melo', 'NORMAL'),
(21, '2024-07-10T00:16:18', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 'juliana.reis@aluno.com', 'senha020', 'Juliana Reis', 'NORMAL'),
(22, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'renato.souza@aluno.com', 'senha021', 'Renato Souza', 'NORMAL'),
(23, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'julio.borges@aluno.com', 'senha022', 'Julio Borges', 'NORMAL'),
(24, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'maria.fernanda@aluno.com', 'senha023', 'Maria Fernanda', 'NORMAL'),
(25, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'pedro.lopes@aluno.com', 'senha024', 'Pedro Lopes', 'NORMAL'),
(26, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'carla.costa@aluno.com', 'senha025', 'Carla Costa', 'NORMAL'),
(27, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'thais.souza@aluno.com', 'senha026', 'Thais Souza', 'NORMAL'),
(28, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'renan.pereira@aluno.com', 'senha027', 'Renan Pereira', 'NORMAL'),
(29, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'mariana.goncalves@aluno.com', 'senha028', 'Mariana Gonçalves', 'NORMAL'),
(30, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'jorge.santos@aluno.com', 'senha029', 'Jorge Santos', 'NORMAL'),
(31, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'nathalia.martins@aluno.com', 'senha030', 'Nathalia Martins', 'NORMAL'),
(32, '2024-07-10T00:16:18', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 'gabriel.lima@aluno.com', 'senha031', 'Gabriel Lima', 'NORMAL'),
(33, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'leticia.alves@aluno.com', 'senha032', 'Leticia Alves', 'NORMAL'),
(34, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'roberto.melo@aluno.com', 'senha033', 'Roberto Melo', 'NORMAL'),
(35, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'isabela.reis@aluno.com', 'senha034', 'Isabela Reis', 'NORMAL'),
(36, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'lucas.souza@aluno.com', 'senha035', 'Lucas Souza', 'NORMAL'),
(37, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'claudia.oliveira@aluno.com', 'senha036', 'Claudia Oliveira', 'NORMAL'),
(38, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'marcos.pereira@aluno.com', 'senha037', 'Marcos Pereira', 'NORMAL'),
(39, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'jessica.costa@aluno.com', 'senha038', 'Jessica Costa', 'NORMAL'),
(40, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'antonio.borges@aluno.com', 'senha039', 'Antonio Borges', 'NORMAL'),
(41, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'michele.silva@aluno.com', 'senha040', 'Michele Silva', 'NORMAL'),
(42, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'andre.santos@aluno.com', 'senha041', 'André Santos', 'NORMAL'),
(43, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'marta.gomes@aluno.com', 'senha042', 'Marta Gomes', 'NORMAL'),
(44, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'thiago.silva@aluno.com', 'senha043', 'Thiago Silva', 'NORMAL'),
(45, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'renata.fernandes@aluno.com', 'senha044', 'Renata Fernandes', 'NORMAL'),
(46, '2024-07-10T00:16:18', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 'marcio.pereira@aluno.com', 'senha045', 'Marcio Pereira', 'NORMAL'),
(47, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'monique.melo@aluno.com', 'senha046', 'Monique Melo', 'NORMAL'),
(48, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'ricardo.costa@aluno.com', 'senha047', 'Ricardo Costa', 'NORMAL'),
(49, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'andreia.oliveira@aluno.com', 'senha048', 'Andreia Oliveira', 'NORMAL'),
(50, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'mario.reis@aluno.com', 'senha049', 'Mario Reis', 'NORMAL'),
(51, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'sara.martins@aluno.com', 'senha050', 'Sara Martins', 'NORMAL'),
(52, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'marina.souza@aluno.com', 'senha051', 'Marina Souza', 'NORMAL'),
(53, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'giovanni.borges@aluno.com', 'senha052', 'Giovanni Borges', 'NORMAL'),
(54, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'julia.lima@aluno.com', 'senha053', 'Julia Lima', 'NORMAL'),
(55, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'fabio.reis@aluno.com', 'senha054', 'Fabio Reis', 'NORMAL'),
(56, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'larissa.pereira@aluno.com', 'senha055', 'Larissa Pereira', 'NORMAL'),
(57, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'guilherme.gomes@aluno.com', 'senha056', 'Guilherme Gomes', 'NORMAL'),
(58, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'renata.santos@aluno.com', 'senha057', 'Renata Santos', 'NORMAL'),
(59, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'bruno.reis@aluno.com', 'senha058', 'Bruno Reis', 'NORMAL'),
(60, '2024-07-10T00:16:18', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 'victoria.martins@aluno.com', 'senha059', 'Victoria Martins', 'NORMAL'),
(61, '2024-07-10T00:16:18', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 'matheus.pereira@aluno.com', 'senha060', 'Matheus Pereira', 'NORMAL'),
(62, '2024-07-10T00:16:18', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 'roberto.silva@aluno.com', 'senha061', 'Roberto Silva', 'NORMAL'),
(63, '2024-07-10T00:16:18', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 'amanda.souza@aluno.com', 'senha062', 'Amanda Souza', 'NORMAL'),
(64, '2024-07-10T00:16:18', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 'luan.pereira@aluno.com', 'senha063', 'Luan Pereira', 'NORMAL'),
(65, '2024-07-10T00:16:18', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 'patricia.oliveira@aluno.com', 'senha064', 'Patricia Oliveira', 'NORMAL'),
(66, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'marcio.santos@aluno.com', 'senha065', 'Marcio Santos', 'NORMAL'),
(67, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'laura.reis@aluno.com', 'senha066', 'Laura Reis', 'NORMAL'),
(68, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'jose.martins@aluno.com', 'senha067', 'José Martins', 'NORMAL'),
(69, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'bianca.costa@aluno.com', 'senha068', 'Bianca Costa', 'NORMAL'),
(70, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'pedro.souza@aluno.com', 'senha069', 'Pedro Souza', 'NORMAL'),
(71, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'vanessa.lima@aluno.com', 'senha070', 'Vanessa Lima', 'NORMAL'),
(72, '2024-07-10T00:16:18', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 'mario.silva@aluno.com', 'senha071', 'Mario Silva', 'NORMAL'),
(73, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'nathalia.souza@aluno.com', 'senha072', 'Nathalia Souza', 'NORMAL'),
(74, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'guilherme.costa@aluno.com', 'senha073', 'Guilherme Costa', 'NORMAL'),
(75, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'renan.santos@aluno.com', 'senha074', 'Renan Santos', 'NORMAL'),
(76, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'clara.melo@aluno.com', 'senha075', 'Clara Melo', 'NORMAL'),
(77, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'daniela.oliveira@aluno.com', 'senha076', 'Daniela Oliveira', 'NORMAL'),
(78, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'luiz.martins@aluno.com', 'senha077', 'Luiz Martins', 'NORMAL'),
(79, '2024-07-10T00:16:18', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 'joana.reis@aluno.com', 'senha078', 'Joana Reis', 'NORMAL'),
(80, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'emilia.lima@aluno.com', 'senha079', 'Emilia Lima', 'NORMAL'),
(81, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'felipe.pereira@aluno.com', 'senha080', 'Felipe Pereira', 'NORMAL'),
(82, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'rafael.souza@aluno.com', 'senha081', 'Rafael Souza', 'NORMAL'),
(83, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'viviane.santos@aluno.com', 'senha082', 'Viviane Santos', 'NORMAL'),
(84, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'gabriel.silva@aluno.com', 'senha083', 'Gabriel Silva', 'NORMAL'),
(85, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'julia.costa@aluno.com', 'senha084', 'Julia Costa', 'NORMAL'),
(86, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'andre.lima@aluno.com', 'senha085', 'André Lima', 'NORMAL'),
(87, '2024-07-10T00:16:18', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 'carol.reis@aluno.com', 'senha086', 'Carol Reis', 'NORMAL'),
(88, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'marcelo.santos@aluno.com', 'senha087', 'Marcelo Santos', 'NORMAL'),
(89, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'felipe.oliveira@aluno.com', 'senha088', 'Felipe Oliveira', 'NORMAL'),
(90, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'beatriz.souza@aluno.com', 'senha089', 'Beatriz Souza', 'NORMAL'),
(91, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'lucas.pereira@aluno.com', 'senha090', 'Lucas Pereira', 'NORMAL'),
(92, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'elena.martins@aluno.com', 'senha091', 'Elena Martins', 'NORMAL'),
(93, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'gustavo.costa@aluno.com', 'senha092', 'Gustavo Costa', 'NORMAL'),
(94, '2024-07-10T00:16:18', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 'amanda.alves@aluno.com', 'senha093', 'Amanda Alves', 'NORMAL'),
(95, '2024-07-10T00:16:18', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'sergio.pereira@aluno.com', 'senha094', 'Sergio Pereira', 'NORMAL'),
(96, '2024-07-10T00:16:18', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'marta.reis@aluno.com', 'senha095', 'Marta Reis', 'NORMAL'),
(97, '2024-07-10T00:16:18', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'thiago.santos@aluno.com', 'senha096', 'Thiago Santos', 'NORMAL'),
(98, '2024-07-10T00:16:18', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'luan.martins@aluno.com', 'senha097', 'Luan Martins', 'NORMAL'),
(99, '2024-07-10T00:16:18', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'veronica.lima@aluno.com', 'senha098', 'Veronica Lima', 'NORMAL'),
(100, '2024-07-10T00:16:18', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 'rogerio.souza@aluno.com', 'senha099', 'Rogerio Souza', 'NORMAL');

INSERT INTO tb_categoria (id, curso_id, horas_multiplicador, nome, porcentagem_horas_maximas, descricao) VALUES
-- Engenharia da Computação
('7e1d4c7a-5b4f-4d7c-927d-6e5e4dcb96c8', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 1.5, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Engenharia da Computação'),
('a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 1.2, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Engenharia da Computação'),
('6e9f1c24-b1c8-4b15-a6f7-8c5e3b8d72ef', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 0.6, 'Curso em outra área de concentração do Curso', 0.4, 'Participação em cursos de outras áreas da Engenharia'),
('5d6f8b37-a8c4-49a4-a0d7-2e4b5a6f7d89', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 2.5, 'Iniciação Científica', 0.5, 'Desenvolvimento de projetos de iniciação científica dentro da área de Engenharia'),
('c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', '7b1c2f69-4f9a-4e8a-b3ad-8b2d3c2b5b6e', 1.8, 'Apresentação de Seminário', 0.3, 'Apresentação de seminários em eventos acadêmicos ou conferências da área'),

-- Engenharia Mecatrônica
('8a5b9d6e-f1c2-4d8f-87a9-3b7e2c1d6f4e', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 1.4, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Engenharia Mecatrônica'),
('4f3e2d1c-b9a7-4c5b-8e6d-1a3f4b7d8c9e', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 1.3, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Engenharia Mecatrônica'),
('d1f3e5b6-8a7c-4d9e-91b0-2c5d6e7f8a9b', '3a8d56d5-6f3e-4a1f-9b2e-c4f9aefc8e3c', 2.0, 'Iniciação Científica', 0.5, 'Desenvolvimento de projetos de iniciação científica na área de Engenharia Mecatrônica'),

-- Engenharia Civil
('7c5e4d3a-9b8f-4a1c-6d7e-8a2b3c4d5f6e', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 1.5, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Engenharia Civil'),
('9d8c7e6f-5b4a-4c3d-9e2f-1b7a8c9d0e4f', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 1.3, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Engenharia Civil'),
('1e2d3c4f-9a8b-4d7e-6c5f-3b8a2d1e7f9c', '29f9c78e-5267-46b3-a843-9f0a0efb7c6f', 2.1, 'Curso em outra área', 0.4, 'Participação em cursos de outras áreas'),

-- Bacharelado em Moda
('6f5b4e3d-a9c1-4d2e-8a7f-9b3c0e1d2a4e', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 1.6, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Moda'),
('2e7f5b1c-4d9a-4d6e-3c8b-1a0e2f7d9c4a', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 1.4, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Moda'),
('b4e1d7c8-9a2f-4c3e-5b6d-7a8c9e0f2d1a', 'c7a2b0c7-1f4b-4df1-bd7f-4b46c8a2bf70', 2.2, 'Iniciação Científica', 0.5, 'Desenvolvimento de projetos de iniciação científica na área de Moda'),

-- Medicina
('5f9c1e2b-a7d4-4b6e-8a3c-1d2e7f9a0b4c', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 1.8, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Medicina'),
('3e5b7f1a-9c4d-4d2e-6a8c-7b9e0f1c2d3a', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 1.6, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Medicina'),
('7a1b4c2d-9e6f-4d8e-3b5c-2a7f9e0d1c4b', 'd2b90ef3-4783-4e84-94db-2e6d7e9af3fb', 2.3, 'Iniciação Científica', 0.5, 'Desenvolvimento de projetos de iniciação científica na área de Medicina'),

-- Direito
('4c5d8a9e-b2f1-4e7a-3c6b-9d2e0f1a7c8b', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 1.4, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Direito'),
('2e7f5b1c-9d4a-4d8e-3c6b-1a9e0f2d7c8a', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 1.5, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Direito'),
('8b1d4e7c-9a2f-4d6e-3c5b-7f0e1a2d9c8d', 'f33e8f1e-6b3e-4b2a-9c3f-0e4d1d6f7b99', 2.1, 'Curso em outra área', 0.4, 'Participação em cursos de outras áreas'),

-- Administração
('5d8e1f4b-c2a9-4c7d-3e6f-1b2c7a9e0d8e', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 1.3, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Administração'),
('9a4c1e7b-8d2f-4d6e-3c5b-7e0f1a2d9c8a', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 1.5, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Administração'),
('6c2e8f1d-9b4a-4d7e-3c5b-1a0f2e9d7c8a', 'ab8c4c3b-2c7b-49c1-bb38-6f9b6c1c46d4', 2.1, 'Curso em outra área', 0.4, 'Participação em cursos de outras áreas'),

--Engenharia de Produção
('7e3b4d1a-9c5f-4d6e-8a2c-1b7e0f9d2c4a', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 1.0, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Engenharia de Produção'),
('4b8e1d5c-9a2f-4d6e-3c7b-1f0e2a9d8c4a', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 2.5, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Engenharia de Produção'),
('1d9c4e7f-b2a8-4d6e-3c5b-7e0a2f1d9c8b', 'e5a9bafc-5c2f-4382-b9a6-3a83e24df9e7', 1.0, 'Curso em outra área', 0.4, 'Participação em cursos de outras áreas'),

--Engenharia Ambiental
('3e5b1f9a-4d2c-6e7d-8c0b-1a9e2f7d4c8a', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 1.0, 'Palestra', 0.3, 'Participação em palestras relacionadas à área de Engenharia Ambiental'),
('8a7f1c4b-9e2d-4d6e-3c5b-0a1e2f7c9d8a', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 1.0, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Engenharia Ambiental'),
('9b4d1e7f-2c8a-4d6e-3c5b-1e0f2a7d9c8a', 'dc9a4e1a-489c-4c5b-917a-3d2f6e8f9dbb', 2.0, 'Curso em outra área', 0.4, 'Participação em cursos de outras áreas'),

--Engenharia Elétrica
('6e5b4d8c-1f2a-4d7e-3c9b-7a0e1d2f8c4a', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 1.4, 'Palestra', 0.2, 'Participação em palestras relacionadas à área de Engenharia Elétrica'),
('7c2e1f4b-9d8a-4d6e-3b5c-1f0a2e9d7c8b', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 1.3, 'Curso na área de concentração do Curso', 0.3, 'Participação em cursos específicos da área de Engenharia Elétrica'),
('5d1b4e8c-9a2f-4d7e-3c6b-1f0e2a9d8c4a', '91d5ef3a-83e9-4c3a-857f-5f2b1a47ebc7', 2.0, 'Iniciação Científica', 0.5, 'Desenvolvimento de projetos de iniciação científica na área de Engenharia Elétrica');

-- Inserir atividades
INSERT INTO tb_atividade (id, usuario_id, categoria_id, titulo, created_at, carga_horaria, status) VALUES
('9e0f1a2b-3c4d-5e6f-7a8b-0c1d2e3f4a5b', 27,'7e1d4c7a-5b4f-4d7c-927d-6e5e4dcb96c8', 'Palestra sobre Circuitos Elétricos', '2024-07-10T00:16:18', 12, 'APROVADA'),
('1a2b3c4d-5e6f-7a8b-9c0d-4e5f6a7b8c9d', 28,'7e1d4c7a-5b4f-4d7c-927d-6e5e4dcb96c8', 'Workshop de Algoritmos', '2024-07-10T00:16:18', 15,'APROVADA'),
('8c9d0e1a-2b3c-4d5e-6f7a-0b8c1d2e3f4a', 29,'7e1d4c7a-5b4f-4d7c-927d-6e5e4dcb96c8', 'Seminário sobre Robótica', '2024-07-10T00:16:18', 20,'APROVADA'),
('6a7b8c9d-0e1f-2c3d-4e5f-8a9b0c1d2e3f', 22,'7e1d4c7a-5b4f-4d7c-927d-6e5e4dcb96c8','Congresso de Materiais de Construção', '2024-07-10T00:16:18', 18,'APROVADA'),
('5f6a7b8c-9d0e-1a2b-3c4d-7e8f9a0c1d2e', 22,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21','Curso de Gestão Ambiental', '2024-07-10T00:16:18', 14,'APROVADA'),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 25,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21','Curso de Gestão da Produção', '2024-07-10T00:16:18', 12,'APROVADA'),
('7b8c9d0e-1a2f-4b5c-6d7e-8f9a0c1d2e3f', 30,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21', 'Palestra sobre Processos Químicos', '2024-07-10T00:16:18', 22,'APROVADA'),
('9d0e1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a4b', 33,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21', 'Workshop de Telecomunicações', '2024-07-10T00:16:18', 16,'APROVADA'),
('4e5f6a7b-8c9d-0a1b-2c3d-4e5f6a7b8c9d', 28,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21', 'Curso de Ciência dos Materiais', '2024-07-10T00:16:18', 20,'APROVADA'),
('1b2c3d4e-5f6a-7b8c-9d0e-1a2f3a4b5c6d', 29,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21', 'Congresso de Engenharia Naval', '2024-07-10T00:16:18', 19,'APROVADA'),
('8a9b0c1d-2e3f-4a5b-6c7d-8e9f0a1b2c3d', 21,'a3b1e1a0-c4e2-4a5d-9d8b-df3b6a6c9f21', 'Workshop de Programação Orientada a Objetos', '2024-07-10T00:16:18',  14,'APROVADA'),
('6c7d8e9f-0a1b-2c3d-4e5f-8a9b0c1d2e3f', 22,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Curso Avançado de Banco de Dados', '2024-07-10T00:16:18', 16,'APROVADA'),
('3d4e5f6a-7b8c-9d0e-1a2f-4b5c6d7e8f9a', 23,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Curso de Simulação Computacional', '2024-07-10T00:16:18', 18,'APROVADA'),
('2e5a6b7c-8d9f-0a1b-4c3d-2e6f7a8b9c0d', 24,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Curso de Estatística para Dados', '2024-07-10T00:16:18', 22,'APROVADA'),
('9f8e7d6c-5b4a-3e2f-1c0d-7a8b9e0d1c2f', 25,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Curso Avançado de Engenharia de Software', '2024-07-10T00:16:18', 20,'APROVADA'),
('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 26,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Curso de Inteligência Artificial', '2024-07-10T00:16:18', 25,'APROVADA'),
('7c4b9d8e-1a2f-3d4e-5b6c-7f8a9e0d1c2b', 27,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Workshop de Redes de Computadores', '2024-07-10T00:16:18', 18,'REJEITADA'),
('3e8f1d2b-4a5c-6d7e-9f0a-1b2c3d4e5f6a', 28,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Seminário sobre Gestão de Projetos', '2024-07-10T00:16:18', 15,'REJEITADA'),
('5a6b7c8d-9e0f-4a1b-2c3d-4e5f6a7b8c9d', 29,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Curso de Análise de Dados', '2024-07-10T00:16:18', 14,'REJEITADA'),
('e3b1a2f5-8d4e-43b7-9d3c-0a1b2c3d4e5f', 30,'c3d1e9b4-9c2e-4b6e-91f8-a5d6f2a1c3b4', 'Workshop de Arquitetura de Computadores', '2024-07-10T00:16:18', 16,'REJEITADA');