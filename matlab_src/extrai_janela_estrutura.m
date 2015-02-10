function [x y z] = extrai_janela_estrutura (Dados, indice, janela)

    x = Dados(indice).Janelas.Dados.x(:,janela)
    y = Dados(indice).Janelas.Dados.y(:,janela)
    z = Dados(indice).Janelas.Dados.z(:,janela)