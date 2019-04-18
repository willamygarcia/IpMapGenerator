# IpMapGenerator
Cria mapeamento de Ip de rede local com Ip publico e porta ou Seja CGNAT com Port Mapping, Ideal para quem usa Mikrotik.

# CGN ou CGNAT
A conversão de endereços de rede (CGN ou CGNAT), também conhecida como NAT de Escala Grande (LSN), é uma extensão das tecnologias 
tradicionais de Network Address Translation (NAT) para redes de grande escala e ISPs (Internet Service Providers). 
A CGN fornece uma solução para aliviar o esgotamento do IPv4 e é parte integrante da migração do IPv6. A adoção do Carrier Grade NAT 
se deve principalmente à capacidade de compartilhar um endereço IP global (público) entre vários sites remotos.

# Como Usar o Scritp

1. ./IpMapGenerator.sh
2. Após a execução será solicitado o Endereço de IP de Rede Local
3. Logo após será Solicitado o Endereço de IP Publico no qual ele estará vinculado.
4. A proxima etapa será setar o Range Inicial e Final do Ultimo octeto da rede Local.
5. Ao final será gerado um relatorio com comando capaz de fazer CGN com Mapeamento de Portas automaticamente.
