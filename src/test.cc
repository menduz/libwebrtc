#include <iostream>
#include <memory>
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include <rtc_base/physical_socket_server.h>
#include <rtc_base/ssl_adapter.h>
#include <rtc_base/thread.h>
#include <system_wrappers/include/field_trial.h>

int main(int argc, char *argv[])
{
  webrtc::field_trial::InitFieldTrialsFromString("");

  std::cout << std::this_thread::get_id() << ":"
            << "Main thread" << std::endl;

  return 0;
}