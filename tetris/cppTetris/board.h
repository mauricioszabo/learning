#include "piece.h"

class Board {
	public:
		vector< vector<int> > tabuleiro;
		Piece *peca;
		Piece *next;
		bool mr;
		
		void novaPeca() {
			next = new Piece();
		}
		
		void proximo() {
			peca = next;
			novaPeca();
		}
		
		void esquerda() {
			if(peca->x == 0) return;
			peca->x--;
			if(colide()) peca->x++;
		}
		
		void direita() {
			if(peca->x + peca->matriz[0].size() == 10) return;
			peca->x++;
			if(colide()) peca->x--;
		}
		
		void baixo() {
			if(mr) peca->y++;
			else peca->y += 0.1;
			
			bool colidiu = colide();
			
			if(colidiu || peca->y + peca->matriz.size() > 21) {
				if(peca->y + peca->matriz.size() > 21) peca->y = 21 - peca->matriz.size();
				fixa();
			}
		}
		
		void maisRapido(bool baixo) {
			mr = baixo;
		}
		
		bool colide() {
			int selfy = (int) peca->y;
			
			for(int x = 0; x < peca->matriz[0].size(); x++) for(int y = 0; y < peca->matriz.size(); y++) {
				if(x+peca->x >= 0 && y+selfy >= 0 && x+peca->x < tabuleiro[0].size() && y+selfy < tabuleiro.size()) {
					if(peca->matriz[y][x] && tabuleiro[y+selfy][x+peca->x]) {
						return true;
					}
				}
			}
			return false;
		}
		
		void fixa() {
			//Trava a peça no tabuleiro
			peca->y = ((int) peca->y) - 1;
			if(peca->y < 0) throw 1;
			
			for(int x = peca->x; x < peca->matriz[0].size() + peca->x; x++)
			for(int y = (int) peca->y; y < peca->matriz.size() + (int) peca->y; y++) {
				if(peca->matriz[y-(int) peca->y][x-peca->x]) tabuleiro[y][x] = 1;
			}
			
			delete peca;
			limpa();
			proximo();
		}
			
		void rotaciona() {
			//Rotaciona a peça.
			int colunas = peca->matriz[0].size();
			
			//Acertar as linhas e colunas:
			int antx = peca->x;
			
			peca->x += colunas / 2 - peca->matriz.size() / 2;
			if(colide() || peca->x + peca->matriz.size() > 10 || peca->x < 0) {
				peca->x = antx;
				return;
			}
			
			vector<int> temp;
			vector< vector<int> > transposto;
			int valor = peca->matriz[0].size();
			int valor2 = peca->matriz.size();
			for(int coluna = 0; coluna < valor; coluna++) {
				temp.clear();
				for(int linha = 0; linha < valor2; linha++) {
						temp.push_back(peca->matriz[linha][valor - coluna - 1]);
				}
				transposto.push_back(temp);
			}
			peca->matriz = transposto;
		}
		
		void limpa() {
			for(int y = 0; y < 20; y++) {
				if (tabuleiro[y][0] && tabuleiro[y][1] && tabuleiro[y][2] && tabuleiro[y][3] && tabuleiro[y][4] && tabuleiro[y][5] && 
					tabuleiro[y][6] && tabuleiro[y][7] && tabuleiro[y][8] && tabuleiro[y][9]) {
					tabuleiro.erase(tabuleiro.begin()+y);
					
					vector<int> temp(10, 0);
					tabuleiro.insert(tabuleiro.begin(), temp);
				}
			}
		}
		
		Board() {
			mr = false;
			vector<int> temp(10, 0);
			for(int y = 0; y < 20; y++) tabuleiro.push_back(temp);
			
			novaPeca();
			proximo();
		}
		
		~Board() {
			delete next;
			delete peca;
		}
};

