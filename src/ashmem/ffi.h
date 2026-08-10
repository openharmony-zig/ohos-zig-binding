#pragma once

#include <fcntl.h>
#include <linux/ashmem.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <unistd.h>

// Keep ioctl request construction in the platform headers. Zig translate-c
// cannot currently lower ASHMEM_SET_NAME directly because its _IOW argument
// is an array type, while these inline functions translate cleanly.
static inline int ohos_zig_ashmem_set_name(int fd, const char *name)
{
    return ioctl(fd, ASHMEM_SET_NAME, name);
}

static inline int ohos_zig_ashmem_set_size(int fd, size_t size)
{
    return ioctl(fd, ASHMEM_SET_SIZE, size);
}

static inline int ohos_zig_ashmem_get_size(int fd)
{
    return ioctl(fd, ASHMEM_GET_SIZE);
}

static inline int ohos_zig_ashmem_set_protection(int fd, unsigned long protection)
{
    return ioctl(fd, ASHMEM_SET_PROT_MASK, protection);
}
