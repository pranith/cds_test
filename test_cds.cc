#include <cds/init.h>
#include <cds/gc/hp.h>

#include <thread>

void reader_func(void)
{
	cds::threading::Manager::attachThread();
}

int main()
{
	cds::Initialize();

	std::thread reader(reader_func);
	cds::Terminate();
}
