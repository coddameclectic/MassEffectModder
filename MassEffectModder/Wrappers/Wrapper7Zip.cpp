/*
 * Wrapper 7Zip
 *
 * Copyright (C) 2015-2019 Pawel Kolodziejski
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 */

#include <LzmaLib.h>

int LzmaDecompress(unsigned char *src, unsigned int src_len, unsigned char *dst, unsigned int *dst_len)
{
    size_t len = *dst_len, sLen = src_len - LZMA_PROPS_SIZE;

    int status = LzmaUncompress(dst, &len, &src[LZMA_PROPS_SIZE], &sLen, src, LZMA_PROPS_SIZE);
    if (status == SZ_OK)
        *dst_len = static_cast<unsigned int>(len);

    return status;
}

extern "C" {
#if defined(_WIN32)
int sevenzip_unpack(const wchar_t *path, const wchar_t *output_path, int full_path);
#else
int sevenzip_unpack(const char *path, const char *output_path, int full_path);
#endif
}

int SevenZipUnpack(const void *path, const void *output_path, bool full_path)
{
#if defined(_WIN32)
    return sevenzip_unpack(static_cast<const wchar_t *>(path),
                        static_cast<const wchar_t *>(output_path), (int)full_path);
#else
    return sevenzip_unpack(static_cast<const char *>(path),
                        static_cast<const char *>(output_path), (int)full_path);
#endif
}