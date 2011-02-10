#include <vector>
#include <stdlib.h>

using namespace std;

class Piece {
	public:
		int x;
		float y;
		vector< vector<int> > matriz;
		
		Piece() {
			int valor = rand() % 10;
			
			vector<int> temp;
			
			switch(valor) {
				case 0:
				case 1:
					temp.push_back(1);
					matriz.push_back(temp);
					matriz.push_back(temp);
					matriz.push_back(temp);
					matriz.push_back(temp);
				break;
				case 2:
				case 3:
					temp.push_back(1);
					temp.push_back(1);
					matriz.push_back(temp);
					matriz.push_back(temp);
				break;
				case 4:
					temp.push_back(1);
					temp.push_back(0);
					matriz.push_back(temp);
					matriz.push_back(temp);
					temp[1] = 1;
					matriz.push_back(temp);
				break;
				case 5:
					temp.push_back(1);
					temp.push_back(0);
					matriz.push_back(temp);
					temp[1] = 1;
					matriz.push_back(temp);
					temp[0] = 0;
					matriz.push_back(temp);
				break;
				case 6:
					temp.push_back(1);
					temp.push_back(0);
					matriz.push_back(temp);
					temp[1] = 1;
					matriz.push_back(temp);
					temp[1] = 0;
					matriz.push_back(temp);
				break;
				case 7:
					temp.push_back(0);
					temp.push_back(1);
					matriz.push_back(temp);
					matriz.push_back(temp);
					temp[0] = 1;
					matriz.push_back(temp);
				break;
				case 8:
					temp.push_back(0);
					temp.push_back(1);
					matriz.push_back(temp);
					temp[0] = 1;
					matriz.push_back(temp);
					temp[1] = 0;
					matriz.push_back(temp);
				break;
				case 9:
					temp.push_back(0);
					temp.push_back(1);
					matriz.push_back(temp);
					temp[0] = 1;
					matriz.push_back(temp);
					temp[0] = 0;
					matriz.push_back(temp);
				break;
			}
			x = 5 - matriz[0].size();
			y = matriz.size();
			y = -y;
		}
};
