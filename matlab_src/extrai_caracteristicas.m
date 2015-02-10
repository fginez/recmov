function [janelas] = extrai_caracteristicas ( janelas )

caracteristicas = [];

filtra=0;

for ( i=1:length(janelas) )

    if ( filtra == 1 )
        % filtra o sinal para remover a aceleracao estatica
        h = fpf_eliptico_01_7;
        [b,a] = sos2tf(h.sosMatrix,h.scaleValues); %IIR

        x = filter(b,a,janelas(i).x);
        y = filter(b,a,janelas(i).y);
        z = filter(b,a,janelas(i).z);    
    else
        x=janelas(i).x;
        y=janelas(i).y;
        z=janelas(i).z;
    end
    
    % ******** Extrai as caracteristicas ******** 
    n = calc_norma(x,y,z);
    
    sma = calc_sma(x, y, z, janelas(i).N);
    md_x = calc_media(x);
    md_y = calc_media(y);
    md_z = calc_media(z);
    dp_x = calc_dp(x); % WTF!!!?!?!?!?
    dp_y = calc_dp(y);
    dp_z = calc_dp(z);
    obliq_x = calc_obliquidade(x);
    obliq_y = calc_obliquidade(y);
    obliq_z = calc_obliquidade(z);    
    curtose_x = calc_curtose(x);
    curtose_y = calc_curtose(y);
    curtose_z = calc_curtose(z);    
    svm = calc_svm(x, y, z, janelas(i).N);    
    em = calc_em(x, y, z, janelas(i).N);
    entropia_x = calc_entropia(x);
    entropia_y = calc_entropia(x);
    entropia_z = calc_entropia(z);    
    [xy xz yz] = calc_corr(x,y,z);
    var_x = calc_variacao(x);
    var_y = calc_variacao(y);
    var_z = calc_variacao(z);
    smov_x = calc_seqsmovimento(x, 5);
    smov_y = calc_seqsmovimento(y, 5);
    smov_z = calc_seqsmovimento(z, 5);
    
    md_n = calc_media(n);
    entropia_n = calc_entropia(n);
    var_n = calc_variacao(n);
    smov_n = calc_seqsmovimento(n,5);
    
    [f_x m_x] = calc_max_f(x);
    [f_y m_y] = calc_max_f(y);
    [f_z m_z] = calc_max_f(z);    
    
    % Atualiza a janela
    caracteristicas = [ sma ...         % 1
                        md_x ...         
                        md_y ...         
                        md_z ...         
                        dp_x ...        % 5
                        dp_y ...        
                        dp_z ...        
                        obliq_x ...
                        obliq_y ...                        
                        obliq_z ...     %10                      
                        curtose_x ...     
                        curtose_y ...
                        curtose_z ...
                        svm ...         
                        em ...          % 15
                        xy ...          
                        xz ...          
                        yz ...          
                        var_x ...       
                        var_y ...       % 20
                        var_z ...       
                        entropia_x ...  
                        entropia_y ...  
                        entropia_z ...  
                        f_x ...         % 25
                        m_x ...         
                        f_y ...         
                        m_y ...         
                        f_z ...         
                        m_z ...         % 30
                        smov_x ...      
                        smov_y ...      
                        smov_z ...                              
                        md_n ...
                        entropia_n ...  % 35
                        var_n ...
                        smov_n ...      % 37
                        ];
    
    janelas(i).Caracteristicas = [caracteristicas];
    
end;
