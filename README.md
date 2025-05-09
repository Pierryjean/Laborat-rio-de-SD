Assuntos:
● Máquinas de Estados Finitos.

● Tipos definidos pelo usuário

● Codificação de Estados automática e explícita em VHDL

● Metodologia de projeto de FSM usando dois processos baseada na formulação canônica de FSM.

  Objetivos:
    ● Entender como modelar máquinas de estados finitos – FSM – usando codificação em dois processos (TPM: TwoProcesses Methodology) em VHDL.
    ● Entender a diferença entre as máquinas de Mealy e de Moore.
    ● Consolidar conceitos de concorrência entre processos.
    ● Entender o atributo Enum_encoding em VHDL e como usá-lo para atribuir codificação de estados de forma explícita,
    sobrepondo-se à atribuição automática feita pela ferramenta.
    ● Exercitar diferentes atribuições de codificação de estados em VHDL

Atividades práticas em sala de aula:

1) Acesse o Moodle ou o endereço https://github.com/sistemas-digitais/pseudo-mux-fsm e obtenha o arquivo
VHDL com a declaração da Entity “pseudo_mux.vhd”. Acrescente uma entrada de “reset” a essa Entity.

2) A partir da Entity acima, você implementará nos passos 3 e 4 uma máquina de estados finitos que apresenta o
seguinte comportamento:

A saída Q acompanha o valor da entrada de dados selecionada. Inicialmente (após reset), a entrada de dados A está
selecionada e a saída Q replica o valor da entrada de dados A. Ou seja, sempre que a entrada de dados A mudar de
valor, a saída Q replica o mesmo valor. Quando a entrada de controle S é acionada, a próxima entrada de dados
(nesse caso, a entrada B) passa a ser a entrada selecionada e a saída Q passa a replicar os valores presentes na nova
entrada de dados selecionada. Cada vez que a entrada S é acionada, a próxima entrada de dados é selecionada,
colocando na saída portanto as entradas A → B → C → D → A e assim sucessivamente.

3) Com o Quartus, crie um projeto com a família e o dispositivo FPGA existente no kit do laboratório.

4) Utilizando como base o exemplo discutido no documento “FSM Moore e Mealy em VHDL e codificação
TPM.pdf” e os arquivos VHDL já desenvolvidos em aulas anteriores, crie um modelo em VHDL para
implementar a máquina de estados finitos especificada na atividade 2 acima.

5) Sintetize a descrição do sistema dado para o dispositivo FPGA definido no início do projeto. Acesse o Menu
Tools → Netlist Viewers → RTL Viewer e veja como ficou a lógica de saída da FSM. Verifique se apareceu
algum latch espúrio no seu projeto. Em caso afirmativo, corrija seu código para eliminá-lo.

6) Acesse o Menu Tools → Netlist Viewers → State Machine Viewer. Observe se a máquina de estados mostrada
é coerente com o que você esperava. Investigue também o circuito em → Technology Map Viewer: anote a
quantidade de flip-flops que o Quartus usou para codificar automaticamente os estados da FSM.

7) Implemente um testbench para verificar o funcionamento de sua máquina de estados finitos. Realize a
simulação funcional e observe se o comportamento da saída do sistema atendeu a sua expectativa.

8) Volte ao Quartus e faça a associação de pinos do FPGA ao sistema digital sintetizado, gere o arquivo .sof
(bitstream com o netlist) do sistema digital sintetizado e grave-o no FPGA do kit para testá-lo.

9) Altere o projeto agora usando enum_encoding para forçar a codificação “S0 S1 S2 S3” para sequencial com o
número mínimo de bits, i.e.: “00 01 10 11”, usando assim apenas dois flip-flops. Teste o projeto novamente.
Confira a modificação na quantidade flip-flops. Houve alteração?

10) Você fez até aqui uma Máquina de Mealy, uma Máquina de Moore ou uma máquina Mealy/Moore? Discuta.

11) Desafio (opcional): Se você mantiver a entrada de controle em S acionada o tempo todo, a máquina irá pular
de estado em estado a cada ciclo de clock. Você consegue modificar essa máquina para que isso não aconteça
sem aumentar o número de estados? Isto é, você consegue projetar uma FSM cuja entrada de controle S tenha
obrigatoriamente de voltar a zero para que a FSM avance em seus estados consecutivos?

12) Aproveite também para dar uma olhada nos templates do Quartus em “Insert Template > VHDL > State
Machines”.
