cmake_minimum_required(VERSION 3.7)
project(BoringSSL)
set(CMAKE_CXX_STANDARD 11)

include_directories(
        boringssl/include
        gen/include
        gen/cares
        gen/cares/config_linux
)


set_property(GLOBAL PROPERTY OPENSSL_ROOT_DIR boringssl)

# Android toolchain: need to cp or ln pthreads_types to pthreadstypes.
set(CRYPTO_SOURCES
        src/boringssl/crypto/aes/aes.c
        src/boringssl/crypto/aes/key_wrap.c
        src/boringssl/crypto/aes/mode_wrappers.c
        src/boringssl/crypto/asn1/a_bitstr.c
        src/boringssl/crypto/asn1/a_bool.c
        src/boringssl/crypto/asn1/a_d2i_fp.c
        src/boringssl/crypto/asn1/a_dup.c
        src/boringssl/crypto/asn1/a_enum.c
        src/boringssl/crypto/asn1/a_gentm.c
        src/boringssl/crypto/asn1/a_i2d_fp.c
        src/boringssl/crypto/asn1/a_int.c
        src/boringssl/crypto/asn1/a_mbstr.c
        src/boringssl/crypto/asn1/a_object.c
        src/boringssl/crypto/asn1/a_octet.c
        src/boringssl/crypto/asn1/a_print.c
        src/boringssl/crypto/asn1/a_strnid.c
        src/boringssl/crypto/asn1/a_time.c
        src/boringssl/crypto/asn1/a_type.c
        src/boringssl/crypto/asn1/a_utctm.c
        src/boringssl/crypto/asn1/a_utf8.c
        src/boringssl/crypto/asn1/asn1_lib.c
        src/boringssl/crypto/asn1/asn1_par.c
        src/boringssl/crypto/asn1/asn_pack.c
        src/boringssl/crypto/asn1/f_enum.c
        src/boringssl/crypto/asn1/f_int.c
        src/boringssl/crypto/asn1/f_string.c
        src/boringssl/crypto/asn1/t_bitst.c
        src/boringssl/crypto/asn1/tasn_dec.c
        src/boringssl/crypto/asn1/tasn_enc.c
        src/boringssl/crypto/asn1/tasn_fre.c
        src/boringssl/crypto/asn1/tasn_new.c
        src/boringssl/crypto/asn1/tasn_typ.c
        src/boringssl/crypto/asn1/tasn_utl.c
        src/boringssl/crypto/asn1/x_bignum.c
        src/boringssl/crypto/asn1/x_long.c
        src/boringssl/crypto/asn1/time_support.c
        src/boringssl/crypto/base64/base64.c
        src/boringssl/crypto/bio/bio.c
        src/boringssl/crypto/bio/bio_mem.c
        src/boringssl/crypto/bio/connect.c
        src/boringssl/crypto/bio/fd.c
        src/boringssl/crypto/bio/file.c
        src/boringssl/crypto/bio/hexdump.c
        src/boringssl/crypto/bio/pair.c
        src/boringssl/crypto/bio/printf.c
        src/boringssl/crypto/bio/socket.c
        src/boringssl/crypto/bio/socket_helper.c
        src/boringssl/crypto/bn/add.c
        src/boringssl/crypto/bn/asm/x86_64-gcc.c
        src/boringssl/crypto/bn/bn.c
        src/boringssl/crypto/bn/bn_asn1.c
        src/boringssl/crypto/bn/cmp.c
        src/boringssl/crypto/bn/convert.c
        src/boringssl/crypto/bn/ctx.c
        src/boringssl/crypto/bn/div.c
        src/boringssl/crypto/bn/exponentiation.c
        src/boringssl/crypto/bn/gcd.c
        src/boringssl/crypto/bn/generic.c
        src/boringssl/crypto/bn/kronecker.c
        src/boringssl/crypto/bn/montgomery.c
        src/boringssl/crypto/bn/montgomery_inv.c
        src/boringssl/crypto/bn/mul.c
        src/boringssl/crypto/bn/prime.c
        src/boringssl/crypto/bn/random.c
        src/boringssl/crypto/bn/rsaz_exp.c
        src/boringssl/crypto/bn/shift.c
        src/boringssl/crypto/bn/sqrt.c
        src/boringssl/crypto/buf/buf.c
        src/boringssl/crypto/bytestring/asn1_compat.c
        src/boringssl/crypto/bytestring/ber.c
        src/boringssl/crypto/bytestring/cbb.c
        src/boringssl/crypto/bytestring/cbs.c
        src/boringssl/crypto/chacha/chacha.c
        src/boringssl/crypto/cipher/aead.c
        src/boringssl/crypto/cipher/cipher.c
        src/boringssl/crypto/cipher/derive_key.c
        src/boringssl/crypto/cipher/e_aes.c
        src/boringssl/crypto/cipher/e_des.c
        src/boringssl/crypto/cipher/e_null.c
        src/boringssl/crypto/cipher/e_rc2.c
        src/boringssl/crypto/cipher/e_rc4.c
        src/boringssl/crypto/cipher/e_ssl3.c
        src/boringssl/crypto/cipher/e_tls.c
        src/boringssl/crypto/cipher/tls_cbc.c
        src/boringssl/crypto/cmac/cmac.c
        src/boringssl/crypto/conf/conf.c
        src/boringssl/crypto/cpu-aarch64-linux.c
        src/boringssl/crypto/cpu-arm-linux.c
        src/boringssl/crypto/cpu-arm.c
        src/boringssl/crypto/cpu-intel.c
        src/boringssl/crypto/cpu-ppc64le.c
        src/boringssl/crypto/crypto.c
        src/boringssl/crypto/curve25519/curve25519.c
        src/boringssl/crypto/curve25519/spake25519.c
        src/boringssl/crypto/curve25519/x25519-x86_64.c
        src/boringssl/crypto/des/des.c
        src/boringssl/crypto/dh/check.c
        src/boringssl/crypto/dh/dh.c
        src/boringssl/crypto/dh/dh_asn1.c
        src/boringssl/crypto/dh/params.c
        src/boringssl/crypto/digest/digest.c
        src/boringssl/crypto/digest/digests.c
        src/boringssl/crypto/dsa/dsa.c
        src/boringssl/crypto/dsa/dsa_asn1.c
        src/boringssl/crypto/ec/ec.c
        src/boringssl/crypto/ec/ec_asn1.c
        src/boringssl/crypto/ec/ec_key.c
        src/boringssl/crypto/ec/ec_montgomery.c
        src/boringssl/crypto/ec/oct.c
        src/boringssl/crypto/ec/p224-64.c
        src/boringssl/crypto/ec/p256-64.c
        src/boringssl/crypto/ec/p256-x86_64.c
        src/boringssl/crypto/ec/simple.c
        src/boringssl/crypto/ec/util-64.c
        src/boringssl/crypto/ec/wnaf.c
        src/boringssl/crypto/ecdh/ecdh.c
        src/boringssl/crypto/ecdsa/ecdsa.c
        src/boringssl/crypto/ecdsa/ecdsa_asn1.c
        src/boringssl/crypto/engine/engine.c
        src/boringssl/crypto/err/err.c
        src/boringssl/crypto/evp/digestsign.c
        src/boringssl/crypto/evp/evp.c
        src/boringssl/crypto/evp/evp_asn1.c
        src/boringssl/crypto/evp/evp_ctx.c
        src/boringssl/crypto/evp/p_dsa_asn1.c
        src/boringssl/crypto/evp/p_ec.c
        src/boringssl/crypto/evp/p_ec_asn1.c
        src/boringssl/crypto/evp/p_rsa.c
        src/boringssl/crypto/evp/p_rsa_asn1.c
        src/boringssl/crypto/evp/pbkdf.c
        src/boringssl/crypto/evp/print.c
        src/boringssl/crypto/evp/sign.c
        src/boringssl/crypto/ex_data.c
        src/boringssl/crypto/hkdf/hkdf.c
        src/boringssl/crypto/hmac/hmac.c
        src/boringssl/crypto/lhash/lhash.c
        src/boringssl/crypto/md4/md4.c
        src/boringssl/crypto/md5/md5.c
        src/boringssl/crypto/mem.c
        src/boringssl/crypto/modes/cbc.c
        src/boringssl/crypto/modes/cfb.c
        src/boringssl/crypto/modes/ctr.c
        src/boringssl/crypto/modes/gcm.c
        src/boringssl/crypto/modes/ofb.c
        src/boringssl/crypto/modes/polyval.c
        src/boringssl/crypto/obj/obj.c
        src/boringssl/crypto/obj/obj_xref.c
        src/boringssl/crypto/pem/pem_all.c
        src/boringssl/crypto/pem/pem_info.c
        src/boringssl/crypto/pem/pem_lib.c
        src/boringssl/crypto/pem/pem_oth.c
        src/boringssl/crypto/pem/pem_pk8.c
        src/boringssl/crypto/pem/pem_pkey.c
        src/boringssl/crypto/pem/pem_x509.c
        src/boringssl/crypto/pem/pem_xaux.c
        src/boringssl/crypto/pkcs8/p5_pbev2.c
        src/boringssl/crypto/pkcs8/p8_pkey.c
        src/boringssl/crypto/pkcs8/pkcs8.c
        src/boringssl/crypto/pool/pool.c
        src/boringssl/crypto/rand/deterministic.c
        src/boringssl/crypto/rand/rand.c
        src/boringssl/crypto/rand/urandom.c
        src/boringssl/crypto/rand/windows.c
        src/boringssl/crypto/rc4/rc4.c
        src/boringssl/crypto/refcount_c11.c
        src/boringssl/crypto/refcount_lock.c
        src/boringssl/crypto/rsa/blinding.c
        src/boringssl/crypto/rsa/padding.c
        src/boringssl/crypto/rsa/rsa.c
        src/boringssl/crypto/rsa/rsa_asn1.c
        src/boringssl/crypto/rsa/rsa_impl.c
        src/boringssl/crypto/sha/sha1-altivec.c
        src/boringssl/crypto/sha/sha1.c
        src/boringssl/crypto/sha/sha256.c
        src/boringssl/crypto/sha/sha512.c
        src/boringssl/crypto/stack/stack.c
        src/boringssl/crypto/thread.c
        src/boringssl/crypto/thread_none.c
        src/boringssl/crypto/thread_pthread.c
        src/boringssl/crypto/thread_win.c
        src/boringssl/crypto/x509/a_digest.c
        src/boringssl/crypto/x509/a_sign.c
        src/boringssl/crypto/x509/a_strex.c
        src/boringssl/crypto/x509/a_verify.c
        src/boringssl/crypto/x509/algorithm.c
        src/boringssl/crypto/x509/asn1_gen.c
        src/boringssl/crypto/x509/by_dir.c
        src/boringssl/crypto/x509/by_file.c
        src/boringssl/crypto/x509/i2d_pr.c
        src/boringssl/crypto/x509/pkcs7.c
        src/boringssl/crypto/x509/rsa_pss.c
        src/boringssl/crypto/x509/t_crl.c
        src/boringssl/crypto/x509/t_req.c
        src/boringssl/crypto/x509/t_x509.c
        src/boringssl/crypto/x509/t_x509a.c
        src/boringssl/crypto/x509/x509.c
        src/boringssl/crypto/x509/x509_att.c
        src/boringssl/crypto/x509/x509_cmp.c
        src/boringssl/crypto/x509/x509_d2.c
        src/boringssl/crypto/x509/x509_def.c
        src/boringssl/crypto/x509/x509_ext.c
        src/boringssl/crypto/x509/x509_lu.c
        src/boringssl/crypto/x509/x509_obj.c
        src/boringssl/crypto/x509/x509_r2x.c
        src/boringssl/crypto/x509/x509_req.c
        src/boringssl/crypto/x509/x509_set.c
        src/boringssl/crypto/x509/x509_trs.c
        src/boringssl/crypto/x509/x509_txt.c
        src/boringssl/crypto/x509/x509_v3.c
        src/boringssl/crypto/x509/x509_vfy.c
        src/boringssl/crypto/x509/x509_vpm.c
        src/boringssl/crypto/x509/x509cset.c
        src/boringssl/crypto/x509/x509name.c
        src/boringssl/crypto/x509/x509rset.c
        src/boringssl/crypto/x509/x509spki.c
        src/boringssl/crypto/x509/x509type.c
        src/boringssl/crypto/x509/x_algor.c
        src/boringssl/crypto/x509/x_all.c
        src/boringssl/crypto/x509/x_attrib.c
        src/boringssl/crypto/x509/x_crl.c
        src/boringssl/crypto/x509/x_exten.c
        src/boringssl/crypto/x509/x_info.c
        src/boringssl/crypto/x509/x_name.c
        src/boringssl/crypto/x509/x_pkey.c
        src/boringssl/crypto/x509/x_pubkey.c
        src/boringssl/crypto/x509/x_req.c
        src/boringssl/crypto/x509/x_sig.c
        src/boringssl/crypto/x509/x_spki.c
        src/boringssl/crypto/x509/x_val.c
        src/boringssl/crypto/x509/x_x509.c
        src/boringssl/crypto/x509/x_x509a.c
        src/boringssl/crypto/x509v3/pcy_cache.c
        src/boringssl/crypto/x509v3/pcy_data.c
        src/boringssl/crypto/x509v3/pcy_lib.c
        src/boringssl/crypto/x509v3/pcy_map.c
        src/boringssl/crypto/x509v3/pcy_node.c
        src/boringssl/crypto/x509v3/pcy_tree.c
        src/boringssl/crypto/x509v3/v3_akey.c
        src/boringssl/crypto/x509v3/v3_akeya.c
        src/boringssl/crypto/x509v3/v3_alt.c
        src/boringssl/crypto/x509v3/v3_bcons.c
        src/boringssl/crypto/x509v3/v3_bitst.c
        src/boringssl/crypto/x509v3/v3_conf.c
        src/boringssl/crypto/x509v3/v3_cpols.c
        src/boringssl/crypto/x509v3/v3_crld.c
        src/boringssl/crypto/x509v3/v3_enum.c
        src/boringssl/crypto/x509v3/v3_extku.c
        src/boringssl/crypto/x509v3/v3_genn.c
        src/boringssl/crypto/x509v3/v3_ia5.c
        src/boringssl/crypto/x509v3/v3_info.c
        src/boringssl/crypto/x509v3/v3_int.c
        src/boringssl/crypto/x509v3/v3_lib.c
        src/boringssl/crypto/x509v3/v3_ncons.c
        src/boringssl/crypto/x509v3/v3_pci.c
        src/boringssl/crypto/x509v3/v3_pcia.c
        src/boringssl/crypto/x509v3/v3_pcons.c
        src/boringssl/crypto/x509v3/v3_pku.c
        src/boringssl/crypto/x509v3/v3_pmaps.c
        src/boringssl/crypto/x509v3/v3_prn.c
        src/boringssl/crypto/x509v3/v3_purp.c
        src/boringssl/crypto/x509v3/v3_skey.c
        src/boringssl/crypto/x509v3/v3_sxnet.c
        src/boringssl/crypto/x509v3/v3_utl.c
        src/boringssl/crypto/cipher/e_chacha20poly1305.c
        src/boringssl/crypto/poly1305/poly1305.c
        src/boringssl/crypto/poly1305/poly1305_arm.c
        src/boringssl/crypto/poly1305/poly1305_vec.c
        )

set(SSL_SOURCES
        src/boringssl/ssl/custom_extensions.c
        src/boringssl/ssl/bio_ssl.c
        src/boringssl/ssl/d1_lib.c
        src/boringssl/ssl/d1_srtp.c
        src/boringssl/ssl/dtls_method.c
        src/boringssl/ssl/dtls_record.c
        src/boringssl/ssl/handshake_client.c
        src/boringssl/ssl/handshake_server.c
        src/boringssl/ssl/s3_both.c
        src/boringssl/ssl/s3_lib.c
        src/boringssl/ssl/s3_pkt.c
        src/boringssl/ssl/ssl_aead_ctx.c
        src/boringssl/ssl/ssl_asn1.c
        src/boringssl/ssl/ssl_buffer.c
        src/boringssl/ssl/ssl_cert.c
        src/boringssl/ssl/ssl_privkey.c
        src/boringssl/ssl/ssl_privkey_cc.cc
        src/boringssl/ssl/ssl_cipher.c
        src/boringssl/ssl/ssl_ecdh.c
        src/boringssl/ssl/ssl_file.c
        src/boringssl/ssl/ssl_lib.c
        src/boringssl/ssl/ssl_x509.c
        src/boringssl/ssl/ssl_transcript.c
        src/boringssl/ssl/ssl_session.c
        src/boringssl/ssl/ssl_stat.c
        src/boringssl/ssl/t1_enc.c
        src/boringssl/ssl/t1_lib.c
        src/boringssl/ssl/tls13_both.c
        src/boringssl/ssl/tls13_client.c
        src/boringssl/ssl/tls13_enc.c
        src/boringssl/ssl/tls13_server.c
        src/boringssl/ssl/tls_method.c
        src/boringssl/ssl/tls_record.c
        src/boringssl/ssl/d1_pkt.c
        src/boringssl/ssl/d1_both.c

        genfiles/err_data.c
        )

if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
    set(ARCH "x86_64")
    set(CRYPTO_ASM
        genfiles/linux-x86_64/crypto/aes/aes-x86_64.S
        genfiles/linux-x86_64/crypto/aes/aesni-x86_64.S
        genfiles/linux-x86_64/crypto/aes/bsaes-x86_64.S
        genfiles/linux-x86_64/crypto/aes/vpaes-x86_64.S
        genfiles/linux-x86_64/crypto/bn/rsaz-avx2.S
        genfiles/linux-x86_64/crypto/bn/x86_64-mont.S
        genfiles/linux-x86_64/crypto/bn/x86_64-mont5.S
        genfiles/linux-x86_64/crypto/chacha/chacha-x86_64.S
        genfiles/linux-x86_64/crypto/cipher/chacha20_poly1305_x86_64.S
        genfiles/linux-x86_64/crypto/ec/p256-x86_64-asm.S
        genfiles/linux-x86_64/crypto/md5/md5-x86_64.S
        genfiles/linux-x86_64/crypto/modes/aesni-gcm-x86_64.S
        genfiles/linux-x86_64/crypto/modes/ghash-x86_64.S
        genfiles/linux-x86_64/crypto/rand/rdrand-x86_64.S
        genfiles/linux-x86_64/crypto/sha/sha1-x86_64.S
        genfiles/linux-x86_64/crypto/sha/sha256-x86_64.S
        genfiles/linux-x86_64/crypto/sha/sha512-x86_64.S
        src/boringssl/crypto/curve25519/asm/x25519-asm-x86_64.S
        )

    set_property(SOURCE genfiles/linux-x86_64/crypto/aes/aes-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/aes/aesni-x86_64.S  PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/aes/bsaes-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/aes/vpaes-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/bn/rsaz-avx2.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/bn/x86_64-mont.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/bn/x86_64-mont5.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/chacha/chacha-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/ec/p256-x86_64-asm.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/md5/md5-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/modes/aesni-gcm-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/modes/ghash-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/rand/rdrand-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/sha/sha1-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/sha/sha256-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/sha/sha512-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE src/boringssl/crypto/curve25519/asm/x25519-asm-x86_64.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-x86_64/crypto/cipher/chacha20_poly1305_x86_64.S PROPERTY LANGUAGE C)

elseif (${CMAKE_SYSTEM_PROCESSOR} MATCHES "^arm*")
    set(ARCH "arm")

    set(CRYPTO_ASM
            genfiles/linux-arm/crypto/aes/aes-armv4.S
            genfiles/linux-arm/crypto/aes/aesv8-armx32.S
            genfiles/linux-arm/crypto/aes/bsaes-armv7.S
            genfiles/linux-arm/crypto/bn/armv4-mont.S
            genfiles/linux-arm/crypto/chacha/chacha-armv4.S
            genfiles/linux-arm/crypto/modes/ghash-armv4.S
            genfiles/linux-arm/crypto/modes/ghashv8-armx32.S
            genfiles/linux-arm/crypto/sha/sha1-armv4-large.S
            genfiles/linux-arm/crypto/sha/sha256-armv4.S
            genfiles/linux-arm/crypto/sha/sha512-armv4.S
            src/boringssl/crypto/curve25519/asm/x25519-asm-arm.S
            src/boringssl/crypto/poly1305/poly1305_arm_asm.S
            )

    set_property(SOURCE genfiles/linux-arm/crypto/aes/aes-armv4.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/aes/aesv8-armx32.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/aes/bsaes-armv7.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/bn/armv4-mont.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/chacha/chacha-armv4.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/modes/ghash-armv4.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/modes/ghash-armx32.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/sha/sha1-armv4-large.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/sha/sha256-armv4.S PROPERTY LANGUAGE C)
    set_property(SOURCE genfiles/linux-arm/crypto/sha/sha512-armv4.S PROPERTY LANGUAGE C)
    set_property(SOURCE src/boringssl/crypto/curve25519/asm/x25519-asm-arm.S PROPERTY LANGUAGE C)
    set_property(SOURCE src/boringssl/crypto/poly1305/poly1305_arm_asm.S PROPERTY LANGUAGE C)

endif()

add_library(bcrypto STATIC ${CRYPTO_SOURCES} ${CRYPTO_ASM})

add_library(bssl STATIC ${CRYPTO_SOURCES} ${CRYPTO_ASM} ${SSL_SOURCES})

# Required by boring ssl
#set(CMAKE_C_FLAGS "-std=c99")
# c99 fails to compile pthread_rwlock_t

if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
    set_target_properties(bcrypto PROPERTIES COMPILE_FLAGS "-D__x86_64__")
    set_target_properties(bssl PROPERTIES COMPILE_FLAGS "-D__x86_64__")
elseif (${CMAKE_SYSTEM_PROCESSOR} MATCHES "^arm*")
endif()

#set_target_properties(boringssl PROPERTIES COMPILE_FLAGS "-std=gnu99 -std=gnu++11")
