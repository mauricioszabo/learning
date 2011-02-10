#include "board.h"

#include <SDL.h>
#include <SDL_image.h>

class Principal {
	SDL_Surface *screen;
	SDL_Surface *tabuleiro;
	SDL_Surface *peca;
	SDL_Surface *peca2;
	
	//Cria um tabuleiro:
	Board board;
	
	public:
		Principal() {
			SDL_Init(SDL_INIT_VIDEO);
			
			screen = SDL_SetVideoMode(806, 604, 0, 0);
			tabuleiro = IMG_Load("Tabuleiro.png");
			peca = IMG_Load("Bloco.png");
			peca2 = IMG_Load("Bloco2.png");
			
			//Coloca o desenho do tabuleiro na tela:
			SDL_BlitSurface(tabuleiro, NULL, screen, NULL);
			
			bool done = false;
			while(!done) {
				int ticks = SDL_GetTicks();
				SDL_Event event;
				if(SDL_PollEvent(&event)) {
					switch(event.type) {
						case SDL_QUIT:
							done = true;
						break;
						case SDL_KEYDOWN:
							switch(event.key.keysym.sym) {
								case SDLK_LEFT:
									board.esquerda();
								break;
								case SDLK_RIGHT:
									board.direita();
								break;
								case SDLK_DOWN:
									board.maisRapido(true);
								break;
								case SDLK_UP:
									board.rotaciona();
								break;
								case 'q':
								case 'Q':
									done = true;
							}
						break;
						case SDL_KEYUP:
							if(event.key.keysym.sym == SDLK_DOWN)
								board.maisRapido(false);
						break;
					}
				}
				
				try {
					desenha();
				} catch(int E) {
					printf("GAME OVER!\n\n");
					return;
				}
				
				int tempo = SDL_GetTicks() - ticks;
				//printf("%d\n", tempo);
				if(tempo < 60) SDL_Delay(60 - tempo);
			}
		}
		
		void desenha() {
			SDL_Rect rect1 = {258, 0, 299, 604};
			SDL_Rect rect2 = {605, 85, 120, 120};
			SDL_BlitSurface(tabuleiro, &rect1, screen, &rect1);
			SDL_BlitSurface(tabuleiro, &rect2, screen, &rect2);
			
			//Desenha o tabuleiro
			for(int x = 0; x < 10; x++) for(int y = 0; y < 20; y++) {
				SDL_Rect pos = {x*30+258, y*30+3, 0, 0};
				if(board.tabuleiro[y][x]) SDL_BlitSurface(peca2, NULL, screen, &pos);
			}
			
			//Desenha peça caindo
			int pecay = (int) board.peca->y;
			for(int y = 0; y < board.peca->matriz.size(); y++) for(int x = 0; x < board.peca->matriz[0].size(); x++) {
				SDL_Rect pos = {(x+board.peca->x)*30+258, (y+pecay)*30+3, 0, 0};
				if(board.peca->matriz[y][x]) SDL_BlitSurface(peca, NULL, screen, &pos);
			}
			
			//Desenha a próxima peça
			for(int y = 0; y < board.next->matriz.size(); y++) for(int x = 0; x < board.next->matriz[0].size(); x++) {
				SDL_Rect pos = {(x+2-board.next->matriz[0].size() / 2)*30+605, y*30+85, 0, 0};
				if(board.next->matriz[y][x]) SDL_BlitSurface(peca, NULL, screen, &pos);
			}
			
			board.baixo();
			
			SDL_Flip(screen);
		}
		
		~Principal() {
			SDL_FreeSurface(tabuleiro);
			SDL_FreeSurface(peca);
			SDL_FreeSurface(peca2);
			SDL_Quit();
		}
};

int main(int argc, char *argv[]) {
	Principal P;
	return 0;
}
