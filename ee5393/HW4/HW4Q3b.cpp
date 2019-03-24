#include <iostream>
using namespace std;
class Balancer
{
public:
	Balancer(Balancer* inUp, Balancer* inDown);
	void add();
	int getUp();
	int getDown();
private:
	Balancer* up;
	Balancer* down;
	bool state;
	int upColl;
	int downColl;
};
int Balancer::getUp()
{
	return upColl;
}
int Balancer::getDown()
{
	return downColl;
}
Balancer::Balancer(Balancer* inUp, Balancer* inDown)
{
	up = inUp;
	down = inDown;
	state = false;
	upColl = 0;
	downColl = 0;
}

void Balancer::add()
{
	if (state)
	{
		state = !state;
		if (up==NULL)
		{
			upColl++;
		}
		else
		{
			up->add();
		}
	}
	else
	{
		state = !state;
		if (down == NULL)
		{
			downColl++;
		}
		else
		{
			down->add();
		}
	}
}

int main()
{
	Balancer* B[4];
	B[2]= new Balancer(NULL, NULL);
	B[3] = new Balancer(NULL, NULL);
	B[0] = new Balancer(B[2], B[3]);
	B[1] = new Balancer(B[2], B[3]);
	int x[4] = { 7, 3, 2, 6 };
	for (int i = 0; i<4; i++)
	{
		while (x[i]>0)
		{
			
			B[i%2]->add();
			x[i]--;
		}
	}
	cout << B[2]->getUp() << endl;
	cout << B[2]->getDown() << endl;
	cout << B[3]->getUp() << endl;
	cout << B[3]->getDown() << endl;
	while (true)
	{

	}
}